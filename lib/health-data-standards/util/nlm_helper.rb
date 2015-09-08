require 'rest_client'
require 'nokogiri'

module HealthDataStandards
  module Util
    class NLMHelper
      def self.validateNLMUser(proxy, nlmLicenseCode, nlmUser, nlmPassword)
        RestClient.proxy = proxy
        nlmResult = RestClient.post 'https://uts-ws.nlm.nih.gov/restful/isValidUMLSUser', {user: nlmUser, password: nlmPassword, licenseCode: nlmLicenseCode}
        doc = Nokogiri::XML(nlmResult)
        return doc.search('Result').text == 'true'
      end
    end
  end
end