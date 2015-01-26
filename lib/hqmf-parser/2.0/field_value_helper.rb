module HQMF2

  class FieldValueHelper
    def self.parse_field_values(entry)
      return  if entry.nil?
      criteria = entry.at_xpath("./cda:actCriteria | ./cda:observationCriteria | ./cda:encounterCriteria | ./cda:procedureCriteria | ./cda:supplyCriteria | ./cda:substanceAdministrationCriteria")
      fields = {}
      parse_dset_cd(criteria.at_xpath('./cda:reasonCode', HQMF2::Document::NAMESPACES), 'REASON', fields)
      parse_dset_cd(criteria.at_xpath('./cda:priorityCode', HQMF2::Document::NAMESPACES),'ORDINALITY', fields)
      #not sure how to handle these yet, we dont have a mapping in datacriteria for it
      parse_ivl_int(criteria.at_xpath('./cda:repeatNumber', HQMF2::Document::NAMESPACES),'REPEAT_NUMBER', fields)


      case criteria.name
      when 'encounterCriteria'
        parse_encounter_fields(criteria,fields)
      when 'actCriteria'
        parse_act_criteria_fields(criteria,fields)
      when 'observationCriteria'
        parse_observation_fields(criteria,fields)
      when 'procedureCriteria'
        parse_procedure_fields(criteria,fields)
      when 'supplyCriteria'
        parse_supply_fields(criteria,fields)
      when 'substanceAdministrationCriteria'
        parse_substance_administration_fields(criteria,fields)
      when 'grouperCriteria'
        parse_grouper_fields(criteria,fields)
      end
      fields
    end

    def self.parse_dset_cd(element, field, fields)
      if element
        item = element.at_xpath("./cda:item")
        any = any_flavor(item) || any_flavor(element)
        fields[field] = AnyValue.new if any
        fields[field] = Coded.new(item) if item && !any
      end
    end

    def self.parse_cd(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = Coded.new(element) if element && !any
    end

    def self.parse_ts(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = Value.new(element) if element && !any
    end

    def self.parse_ivl_int(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = Range.new(element) if element && !any
    end

    def self.parse_cs(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
    end

    def self.parse_pq(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = Range.new(element) if element && !any
    end

    #handle any value
    def self.parse_any(element,field,fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = DateCriteria.parse_value(element) if element && !any
    end

    def self.any_flavor(element)
      (element && element["flavorId"] == "ANY.NONNULL")
    end

    def self.parse_value(element,field,fields)
       any = any_flavor(element)
      fields[field] = AnyValue.new if any
      fields[field] = DateCriteria.parse_value(element) if element && !any
    end


    def self.parse_act_criteria_fields(entry,fields)

    end

    def self.parse_substance_administration_fields(entry,fields)

      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES),'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:approachSiteCode', HQMF2::Document::NAMESPACES),'ANTOMICAL_APPROACH_SITE', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),'ANATOMICAL_TARGET_SITE', fields)
      parse_cd(entry.at_xpath('./cda:routeCode', HQMF2::Document::NAMESPACES),'ROUTE', fields)
      parse_pq(entry.at_xpath('./cda:doseQuantity', HQMF2::Document::NAMESPACES),'DOSE', fields)
      # deal with refills
      parse_pq(entry.at_xpath('./cda:repeatNumber', HQMF2::Document::NAMESPACES),'REFILLS', fields)

      template_ids = extract_template_ids(entry)
      if !template_ids.index('2.16.840.1.113883.10.20.28.3.51').nil?
        # signed datetime, start datetime, stop datetime
        times = [{key: 'signeddatetime', field: "SIGNED_DATETIME" , highlow: 'high'},
                 {key: 'startdatetime', field:  "START_DATETIME", highlow: 'low'},
                 {key: 'stopdatetime', field:  "STOP_DATETIME", highlow: 'high'},
                 ]
        times.each do |e|
          date = entry.at_xpath("cda:participation[@typeCode='AUT']/cda:role/cda:id/cda:item[@extension = '#{e[:key]}']/../../../cda:time")
          if date
            fields[e[:field]] = Range.new(date)
          end
        end
        #does it have an active startdate, it will be in the effective time if it does
        
        active = entry.at_xpath("./cda:effectiveTime/cda:low/..")
        fields["ACTIVE_DATETIME"] = Range.new(active) if active
      end

    end

    def self.parse_observation_fields(entry,fields)

      # parse_dset_cd(entry.at_xpath('./cda:interpretationCode', HQMF2::Document::NAMESPACES),'INTERPRETATION', fields)
      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES),'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),'ANATOMICAL_TARGET_SITE', fields)
      # handle date based field values -- they can show up in odd locations


    end

    def self.parse_encounter_fields(entry,fields)

      # parse_cd(entry.at_xpath('./cda:admissionReferalSourceCode', HQMF2::Document::NAMESPACES),'SOURCE', fields)
      parse_pq(entry.at_xpath('./cda:lengthOfStayQuantity', HQMF2::Document::NAMESPACES),'LENGTH_OF_STAY', fields)
      parse_cd(entry.at_xpath('./cda:dischargeDispositionCode', HQMF2::Document::NAMESPACES),'DISCHARGE_STATUS',fields)

      # handle date based field values -- they can show up in odd locations

    end

    def self.parse_procedure_fields(entry,fields)

      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES),'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:approachSiteCode', HQMF2::Document::NAMESPACES),'ANATOMICAL_APPROACH_SITE', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),'ANATOMICAL_TARGET_SITE', fields)

      # handle date based field values -- they can show up in odd locations

    end

    def self.parse_supply_fields(entry,fields)
    end

    def self.parse_grouper_fields(entry,fields)

    end

    def self.extract_template_ids(entry)
      entry.xpath('./cda:templateId/cda:item', HQMF2::Document::NAMESPACES).collect do |template_def|
        HQMF2::Utilities.attr_val(template_def, '@root')
      end
    end
  end
end
