require 'zip/zipfilesystem'
require 'spreadsheet'
require 'google_spreadsheet'
require 'roo'
require 'iconv'

module HQMF
  module ValueSet
    class Parser
  
      GROUP_CODE_SET = "GROUPING"
  
      ORGANIZATION_TITLE = "Value Set Developer"
      OID_TITLE = "Value Set OID"
      CONCEPT_TITLE = "Value Set Name"
      CATEGORY_TITLE = "QDM Category"
      CODE_SET_TITLE ="Code System"
      VERSION_TITLE = "Code System Version"
      CODE_TITLE = "Code"
      DESCRIPTION_TITLE = "Descriptor"
      
      CODE_SYSTEM_NORMALIZER = {
        'ICD-9'=>'ICD-9-CM',
        'ICD-10'=>'ICD-10-CM',
        'HL7 (2.16.840.1.113883.5.1)'=>'HL7'
      }
      IGNORED_CODE_SYSTEM_NAMES = ['Grouping', 'GROUPING' ,'HL7', "Administrative Sex"]
  
      def initialize()
      end
  
      # import an excel matrix array into mongo
      def parse(file, options={})
        sheet_array = file_to_array(file, options)
        by_oid_ungrouped = cells_to_hashs_by_oid(sheet_array)
        collapse_groups(by_oid_ungrouped)
      end
  
      def collapse_groups(by_oid_ungrouped)
    
        final = []
    
        # select the grouped code sets and fill in the children... also remove the children that are a
        # member of a group.  We remove the children so that we can create parent groups for the orphans
        (by_oid_ungrouped.select {|key,value| value["code_set"].upcase == GROUP_CODE_SET}).each do |key, value|
          # remove the group so that it is not in the orphan list
          by_oid_ungrouped.delete(value["oid"])
          codes = []
          value["codes"].each do |child_oid|
#            codes << by_oid_ungrouped.delete(child_oid)
            # do not delete the children of a group.  These may be referenced by other groups or directly by the measure
            code = by_oid_ungrouped[child_oid]
            puts "\tcode could not be found: #{child_oid}" unless code
            codes << code if code
            # for hierarchies we need to probably have codes be a hash that we select from if we don't find the
            # element in by_oid_ungrouped we may need to look for it in final
          end
          value["code_sets"] = codes
          value.delete("codes")
          value.delete("code_set")
          final << value
        end
    
        # fill out the orphans
        by_oid_ungrouped.each do |key, orphan|
          final << adopt_orphan(orphan)
        end
        
        deleted = []
        final.delete_if {|x| to_delete = x['code_sets'].nil? || x['code_sets'].empty?; deleted << x if to_delete; to_delete }
        deleted.each do |value|
          puts "\tDeleted value set with no code sets: #{value['oid']}"
        end
        final
    
      end
  
      def adopt_orphan(orphan)
        parent = orphan.dup
        parent["code_sets"] = [orphan]
        parent.delete("codes")
        parent.delete("code_set")
        parent
      end
  
      # take an excel matrix array and turn it into an array of db models
      def cells_to_hashs_by_oid(array)
        a = Array.new(array)                  # new variable for reentrant
        headers = a.shift.map {|i| i.to_s }   # because of this shift
        string_data = a.map {|row| row.map {|cell| cell.to_s } }
        array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }

        by_oid = {}
        array_of_hashes.each do |row|
          entry = convert_row(row)
          
          existing = by_oid[entry["oid"]]
          if (existing)
            existing["codes"].concat(entry["codes"])
          else
            by_oid[entry["oid"]] = entry
          end
        end
    
        by_oid
      end
  
      def self.get_format(file_path)
        if file_path =~ /xls$/
          :xls
        elsif file_path =~ /xlsx$/
          :xlsx
        end
      end
  
      private
  
      def convert_row(row)
        # Value Set Developer
        # Value Set OID
        # Value Set Name
        # QDM Category
        # Code System
        # Code System Version
        # Code
        # Descriptor
        value = {
          "key" => normalize_names(row[CATEGORY_TITLE],row[CONCEPT_TITLE]),
          "organization" => row[ORGANIZATION_TITLE],
          "oid" => row[OID_TITLE].strip.gsub(/[^0-9\.]/i, ''),
          "concept" => normalize_names(row[CONCEPT_TITLE]),
          "category" => normalize_names(row[CATEGORY_TITLE]),
          "code_set" => normalize_code_system(row[CODE_SET_TITLE]),
          "version" => row[VERSION_TITLE],
          "codes" => extract_code(row[CODE_TITLE], row[CODE_SET_TITLE]),
          "description" => row[DESCRIPTION_TITLE]
        }
        value['codes'].map! {|code| code.strip.gsub(/[^0-9\.]/i, '')} if (value['code_set'].upcase == GROUP_CODE_SET)
        value
      end
  
      # Break all the supplied strings into separate words and return the resulting list as a
      # new string with each word separated with '_'
      def normalize_names(*components)
        name = []
        components.each do |component|
          name.concat component.gsub(/\W/,' ').split.collect { |word| word.strip.downcase }
        end
        name.join '_'
      end
      
      def normalize_code_system(code_system_name)
        code_system_name = CODE_SYSTEM_NORMALIZER[code_system_name] if CODE_SYSTEM_NORMALIZER[code_system_name]
        return code_system_name if IGNORED_CODE_SYSTEM_NAMES.include? code_system_name
        oid = HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(code_system_name)
        puts "\tbad code system name: #{code_system_name}" unless oid
        code_system_name
      end
  
      def extract_code(code, set)
    
        code.strip!
        if set=='CPT' && code.include?('-')
          eval(code.strip.gsub('-','..')).to_a.collect { |i| i.to_s }
        else
          [code]
        end
    
      end
  
      def file_to_array(file_path, options)
        defaults = {
          :columns => 2,  # range of import
          :sheet => 1     # only one sheet at a time can be worked on
        }
        options = defaults.merge(options)
        
        book = book_by_format(file_path, options[:format])
        book.default_sheet=book.sheets[options[:sheet]]
    
        # catch double byte encoding problems in spreadsheet files
        # Encoding::InvalidByteSequenceError: "\x9E\xDE" on UTF-16LE
        begin
          book.to_matrix.to_a
        rescue Encoding::InvalidByteSequenceError => e
          raise "Spreadsheet encoding problem: #{e}"
        end
      end
      
      def book_by_format(file_path, format)
        format = HQMF::ValueSet::Parser.get_format(file_path) unless format
        
        if format == :xls
          book = Excel.new(file_path, nil, :ignore)
        elsif format == :xlsx
          book = Excelx.new(file_path, nil, :ignore)
        else
          raise "File does not end in .xls or .xlsx"
        end
        book
      end
  
  
    end
  end
end
