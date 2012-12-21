module HQMF
  class Parser
    
    HQMF_VERSION_1 = "1.0"
    HQMF_VERSION_2 = "2.0"
    
    def self.parse(hqmf_contents, version, codes = nil)
      
      HQMF::Counter.instance.reset()
      case version
        when HQMF_VERSION_1
          puts("\tCodes not passed in, cannot backfill properties like gender") unless codes
          HQMF::DocumentConverter.convert(HQMF1::Document.new(hqmf_contents).to_json, codes)
        when HQMF_VERSION_2
          HQMF2::Document.new(hqmf_contents).to_model
        else
          raise "Unsupported HQMF version specified: #{version}"
      end
    end
    
    def self.parse_id(hqmf_contents, version)
      case version
        when HQMF_VERSION_1
          doc = HQMF1::Document.parse(hqmf_contents)
          doc.at_xpath('//cda:id/@root').value.upcase
        when HQMF_VERSION_2
          doc = HQMF2::Document.parse(hqmf_contents)
          doc.at_xpath('cda:QualityMeasureDocument/cda:id/@extension', HQMF2::Document::NAMESPACES).value.upcase
        else
          raise "Unsupported HQMF version specified: #{version}"
      end
    end
  end
  
end