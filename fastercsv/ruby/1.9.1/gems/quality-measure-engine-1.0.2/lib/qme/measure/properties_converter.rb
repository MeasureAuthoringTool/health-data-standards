require 'roo'

module QME
  module Measure
  
    # Utility class for converting NQF XLS files to JSON
    class Converter
    
      #Convert an NQF XLS file to a hash
      def self.from_xls(file)
        xls =Excelx.new(file)
        xls.default_sheet='Measure_QDS'
        result = {}
        (xls.header_line+1..xls.last_row).each do |row|
          entry = {}
          (xls.first_column..xls.last_column).each do |column|
            entry[xls.cell(xls.header_line, column)] = xls.cell(row, column)
          end
          result[entry['QDS_id']] = entry
        end
        result
      end
      
    end
    
  end
end
