module HealthDataStandards
  module Import
    module Hdata
      class MetadataImporter
        include Singleton
        
        def import(meta_xml)
          meta_xml.root.add_namespace_definition("hrf-md", Metadata::NS)
          meta_element = meta_xml.at_xpath("./hrf-md:DocumentMetaData")
          return unless meta_element
          
          meta = Metadata::Base.new
          
          extract_metadata(meta_element, meta)

          meta
        end
        
        def extract_metadata(meta_element, meta)
          meta.mime_types = meta_element.xpath("./hrf-md:MediaType").map { |media| media.text }
          meta.confidentiality = meta_element.at_xpath("./hrf-md:Confidentiality").try(:text)
          meta.pedigrees = meta_element.xpath("./hrf-md:PedigreeInfo").map { |ped| extract_pedigree(ped) }
          creation_el = meta_element.at_xpath("./hrf-md:RecordDate/hrf-md:CreatedDateTime")
          meta.original_creation_time = Time.parse(creation_el.text) if creation_el
          meta.linked_documents = meta_element.xpath("./hrf-md:LinkedDocuments/hrf-md:Link").map {|l| extract_link_info(l)}
          copied_elements = meta_element.xpath("./hrf-md:RecordDate/hrf-md:Copied/hrf-md:CopiedInfo")
          meta.copied_dates = copied_elements.map { |cp| extract_change_info(cp) }
          modified_elements = meta_element.xpath("./hrf-md:RecordDate/hrf-md:Modified/hrf-md:ModifiedInfo")
          meta.modified_dates = modified_elements.map { |md| extract_change_info(md) }
          meta
        end
        
        def extract_pedigree(pedi_el)
          return unless pedi_el
          
          author = extract_author(pedi_el)
          organization = pedi_el.at_xpath("./hrf-md:Organization")
          
          ped = Metadata::Pedigree.new(author: author,
                             organization: organization.try(:content))
                              
          source_pedigree_els = pedi_el.xpath("./hrf-md:Source/hrf-md:PedigreeInfo")
          ped.source_pedigrees = source_pedigree_els.map { |ped_el| extract_pedigree(ped_el) }
          ped.derived = pedi_el.attribute("derived")# == "true" ? true : false
          # ped.signature = pedi_el.at_xpath("./hrf-md:Signature/")
          
          source_doc_els = pedi_el.xpath("./hrf-md:Source/hrf-md:Document")
          ped.source_documents = source_doc_els.map { |doc_el| extract_link_info(doc_el) }
          
          ped
        end
        
        def extract_author(pedi_el)
          return unless pedi_el
          author = pedi_el.at_xpath("./hrf-md:Author")
          return unless author
          Metadata::Author.new(name: author.try(:content), 
                               type: author.attribute('typeCode').try("content"), 
                               role: author.attribute('role').try("content"))
        end
        
        def extract_link_info(link_info_el)
          return unless link_info_el
          target_el = link_info_el.at_xpath("./hrf-md:Target")
          return unless target_el
          Metadata::LinkInfo.new(uri: target_el.content, 
                       extension: target_el.attribute("TargetExtension").try(:content))
        end
        
        def extract_change_info(change_info_el)
          return unless change_info_el
          change_info = Metadata::ChangeInfo.new
          change_info.timestamp = change_info_el.at_xpath("./hrf-md:ChangeDateTime").try("content")
          change_info.pedigree = extract_pedigree(change_info_el.at_xpath("./hrf-md:PedigreeInfo"))
          change_info_el
          change_info
        end
        
      end
    end
  end
end