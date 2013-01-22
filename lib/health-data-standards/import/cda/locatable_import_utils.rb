module HealthDataStandards
  module Import
    module CDA
      # Helpers for importing C32 addresses and telecoms
      module LocatableImportUtils
        def import_address(address_element)
          address = Address.new
          address.use = address_element['use']
          address.street = address_element.xpath("./cda:streetAddressLine").map {|street| street.text}
          address.city = address_element.at_xpath("./cda:city").try(:text)
          address.state = address_element.at_xpath("./cda:state").try(:text)
          address.zip = address_element.at_xpath("./cda:postalCode").try(:text)
          address.country = address_element.at_xpath("./cda:country").try(:text)
          address
        end

        def import_telecom(telecom_element)
          tele = Telecom.new
          tele.value = telecom_element['value']
          tele.use = telecom_element['use']
          tele
        end
      end
    end
  end
end