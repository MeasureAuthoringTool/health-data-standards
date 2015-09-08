require 'rest_client'
require 'nokogiri'
module HealthDataStandards
  module Util
    class NLMHelper
      def self.validateNLMUser(nlmUrl, proxy, nlmLicenseCode, nlmUser, nlmPassword)
        RestClient.proxy = proxy
        nlmResult = RestClient.post nlmUrl, {user: nlmUser, password: nlmPassword, licenseCode: nlmLicenseCode}
        doc = Nokogiri::XML(nlmResult)
        return doc.search('Result').text == 'true'
      end
    end
  end
end