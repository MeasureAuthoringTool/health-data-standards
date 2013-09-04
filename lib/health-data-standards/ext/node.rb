# This is a freedom patch that will only be applied when using JRuby
# Currently, Nokogiri does not properly handle namespace prefixes
# when they are set on the document root and then used in XPath
# expressions. We should be able to remove this patch if/when
# Rob's pull request is accepted:
# https://github.com/sparklemotion/nokogiri/pull/959
if RUBY_PLATFORM.include?('java')
  module Nokogiri
    module XML
      NAMESPACES = {'cda' => 'urn:hl7-org:v3',
                'sdtc' => 'urn:hl7-org:sdtc',
                'gc32' => 'urn:hl7-org:greencda:c32',
                'ccr' => 'urn:astm-org:CCR',
                'vs' => 'urn:ihe:iti:svs:2008',
                'xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                'hrf-md' => 'http://www.hl7.org/schemas/hdata/2009/11/metadata',
                'nlm' => 'urn:ihe:iti:svs:2008'
                }
      class Node
        alias_method :old_at_xpath, :at_xpath
        alias_method :old_xpath, :xpath

        def xpath(*args)
          old_xpath(*args, NAMESPACES)
        end

        def at_xpath(*args)
          old_at_xpath(*args, NAMESPACES)
        end
      end

      class NodeSet
        alias_method :old_at_xpath, :at_xpath
        alias_method :old_xpath, :xpath

        def xpath(*args)
          old_xpath(*args, NAMESPACES)
        end

        def at_xpath(*args)
          old_at_xpath(*args, NAMESPACES)
        end
      end
    end
  end
end