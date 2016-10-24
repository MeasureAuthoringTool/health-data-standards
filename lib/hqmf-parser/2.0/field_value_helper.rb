module HQMF2
  # Generates field values based on understanding of the HQMF 2.1 spec
  class FieldValueHelper
    def self.parse_field_values(entry, outboundRelationship)
      return if entry.nil?
      criteria = entry.at_xpath('./cda:actCriteria | ./cda:observationCriteria | ./cda:encounterCriteria |
                                 ./cda:procedureCriteria | ./cda:supplyCriteria |
                                 ./cda:substanceAdministrationCriteria | ./cda:grouperCriteria')

      return {} if criteria.nil?
      fields = {}
      # Negation is handled in the data criteria parsing class and not as a field value.
      # Not using the reasonCode element because the QDM HQMF ig states that reason is in an outbound relationship.
      # parse_dset_cd(criteria.at_xpath('./cda:reasonCode', HQMF2::Document::NAMESPACES), 'REASON', fields) unless
      # negated.
      parse_dset_cd(criteria.at_xpath('./cda:priorityCode', HQMF2::Document::NAMESPACES), 'ORDINAL', fields)
      parse_date_fields(criteria, fields, outboundRelationship)

      handle_fields_per_criteria(criteria, fields)

      fields
    end

    def self.handle_fields_per_criteria(criteria, fields)
      case criteria.name
      when 'encounterCriteria'
        parse_encounter_fields(criteria, fields)
      when 'actCriteria'
        parse_act_criteria_fields(criteria, fields)
      when 'observationCriteria'
        parse_observation_fields(criteria, fields)
      when 'procedureCriteria'
        parse_procedure_fields(criteria, fields)
      when 'supplyCriteria'
        parse_supply_fields(criteria, fields)
      when 'substanceAdministrationCriteria'
        parse_substance_administration_fields(criteria, fields)
      when 'grouperCriteria'
        parse_grouper_fields(criteria, fields)
      end
    end

    # The next group of "parse_" methods handle extracting values for different types of criteria

    def self.parse_dset_cd(element, field, fields)
      if element
        item = element.at_xpath('./cda:item')
        any = any_flavor(item) || any_flavor(element)
        fields[field] = AnyValue.new if any
        fields[field] = Coded.new(item) if item && !any
      end
    end

    # The next group of "parse_" methods also first check if the value is of the "ANY" type, and only parse if it isn't

    def self.parse_cd(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = Coded.new(element) if element && !any
    end

    def self.parse_ts(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = Value.new(element) if element && !any
    end

    def self.parse_ivl_int(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = Range.new(element) if element && !any
    end

    def self.parse_cs(element, field, fields)
      # Only possible result is AnyValue
      check_and_set_if_any(element, field, fields)
    end

    def self.parse_pq(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = Range.new(element) if element && !any
    end

    def self.parse_value(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = DateCriteria.parse_value(element) if element && !any
    end

    # handle any value
    def self.parse_any(element, field, fields)
      any = check_and_set_if_any(element, field, fields)
      fields[field] = DateCriteria.parse_value(element) if element && !any
    end

    # Use when checking if the element is a "ANY" type, sets the field key if it is
    def self.check_and_set_if_any(element, field, fields)
      any = any_flavor(element)
      fields[field] = AnyValue.new if any
      any
    end

    def self.any_flavor(element)
      element && (element['flavorId'] == 'ANY.NONNULL' ||
                  element.at_xpath('@xsi:type', HQMF2::Document::NAMESPACES) == 'ANY')
    end

    def self.parse_date_fields(entry, fields, outboundRelationship)
      # handle embded date fields
      times = [{ key: 'signeddatetime', field: 'SIGNED_DATETIME', highlow: 'high' },
               { key: 'startdatetime', field:  'START_DATETIME', highlow: 'low' },
               { key: 'stopdatetime', field:  'STOP_DATETIME', highlow: 'high' },
               { key: 'recordeddatetime', field: 'RECORDED_DATETIME', highlow: 'high' }
              ]
      times.each do |e|
        date = entry.at_xpath("cda:participation[@typeCode='AUT']/cda:role/cda:id/cda:item[@extension = '#{e[:key]}']/../../../cda:time")
        fields[e[:field]] = Range.new(date, 'IVL_PQ') if date
      end

      # Special case handle effectiveTime element , by default low is start datetime
      # and high is stop datetime.  This changes for certain elements
      template_ids = extract_template_ids(entry)
      template_ids = extract_template_ids(outboundRelationship.entry.xpath('./cda:procedureCriteria')) if template_ids.empty? && outboundRelationship
      low = entry.at_xpath('./cda:effectiveTime/cda:low/..')
      high = entry.at_xpath('./cda:effectiveTime/cda:high/..')

      fields[low_field_name(template_ids)] = Range.new(low, 'IVL_PQ') if low
      fields[high_field_name(template_ids)] = Range.new(high, 'IVL_PQ') if high
    end

    # Returns the proper name for the low field given the list of template ids
    def self.low_field_name(template_ids)
      if template_ids.include?('2.16.840.1.113883.10.20.28.3.51')
        'ACTIVE_DATETIME'
      elsif template_ids.include?('2.16.840.1.113883.10.20.28.3.110') ||
            template_ids.include?('2.16.840.1.113883.10.20.28.3.116')
        'ONSET_DATETIME'
      else
        'ADMISSION_DATETIME'
      end
    end

    # Returns the proper name for the high field given the list of template ids
    def self.high_field_name(template_ids)
      if template_ids.include?('2.16.840.1.113883.10.20.28.3.13')
        'REMOVAL_DATETIME'
      elsif template_ids.include?('2.16.840.1.113883.10.20.28.3.110') ||
            template_ids.include?('2.16.840.1.113883.10.20.28.3.116')
        'ABATEMENT_DATETIME'
      else
        'DISCHARGE_DATETIME'
      end
    end

    # If type code for this field value is LOC, handle specifics
    def self.handle_loc(entry, fields)
      loc = entry.at_xpath("./cda:participation[@typeCode='LOC']/cda:role[@classCode='SDLOC']",
                           HQMF2::Document::NAMESPACES)
      return unless loc
      # does it have an effective time?
      low = loc.at_xpath('./cda:effectiveTime/cda:low/..')
      high = loc.at_xpath('./cda:effectiveTime/cda:high/..')
      code = loc.at_xpath('./cda:code')
      # looking at the 2.4.0 measure bundle these values are set to null if they exist
      # so that is what I am doing for now
      fields['FACILITY_LOCATION_ARRIVAL_DATETIME'] = AnyValue.new if low
      fields['FACILITY_LOCATION_DEPARTURE_DATETIME'] = AnyValue.new if high
      fields['FACILITY_LOCATION'] = Coded.new(code) if code
    end

    # Extract template ids from the given entry
    def self.extract_template_ids(entry)
      entry.xpath('./cda:templateId/cda:item', HQMF2::Document::NAMESPACES).collect do |template_def|
        HQMF2::Utilities.attr_val(template_def, '@root')
      end
    end

    # The "parse_"s after this point handle extraction of data criteria based on field names

    def self.parse_act_criteria_fields(_entry, _fields)
    end

    def self.parse_substance_administration_fields(entry, fields)
      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES), 'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:approachSiteCode', HQMF2::Document::NAMESPACES),
                    'ANATOMICAL_APPROACH_SITE', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),
                    'ANATOMICAL_LOCATION_SITE', fields)
      parse_cd(entry.at_xpath('./cda:routeCode', HQMF2::Document::NAMESPACES), 'ROUTE', fields)
      parse_pq(entry.at_xpath('./cda:doseQuantity', HQMF2::Document::NAMESPACES), 'DOSE', fields)
      parse_pq(entry.at_xpath('./cda:repeatNumber', HQMF2::Document::NAMESPACES), 'REFILLS', fields)
    end

    def self.parse_observation_fields(entry, fields)
      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES), 'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),
                    'ANATOMICAL_LOCATION_SITE', fields)
      parse_cd(entry.at_xpath("./cda:participation[@typeCode='SBJ']/cda:role[@classCode='PRS']/cda:code",
                              HQMF2::Document::NAMESPACES),
               'RELATIONSHIP', fields)
      parse_pq(entry.at_xpath("./cda:outboundRelationship[@typeCode='REFV']/cda:observationCriteria/cda:value/cda:high",
                              HQMF2::Document::NAMESPACES),
               'REFERENCE_RANGE_HIGH', fields)
      parse_pq(entry.at_xpath("./cda:outboundRelationship[@typeCode='REFV']/cda:observationCriteria/cda:value/cda:low",
                              HQMF2::Document::NAMESPACES),
               'REFERENCE_RANGE_LOW', fields)
    end

    # Ignoring line limits here as it would be hard to create the deep xPaths with these limits.
    # rubocop:disable Metrics/LineLength
    def self.parse_encounter_fields(entry, fields)
      # Added a check for Principal Diagnosis and Diagnosis. QDM 4.2 Update
      principal = entry.at_xpath("./cda:outboundRelationship[@typeCode='REFR']/cda:actCriteria/cda:code[@code='52534-5']",
                                 HQMF2::Document::NAMESPACES)
      if principal
        parse_cd(
          entry.at_xpath(
            "./cda:outboundRelationship[@typeCode='REFR']/cda:actCriteria/cda:outboundRelationship[@typeCode='SUBJ']/cda:observationCriteria/cda:value",
            HQMF2::Document::NAMESPACES
          ), 'PRINCIPAL_DIAGNOSIS', fields)
      end

      diagnosis = entry.at_xpath("./cda:outboundRelationship[@typeCode='REFR']/cda:actCriteria/cda:code[@code='29308-4']",
                                 HQMF2::Document::NAMESPACES)
      if diagnosis
        parse_cd(
          entry.at_xpath(
            "./cda:outboundRelationship[@typeCode='REFR']/cda:actCriteria/cda:outboundRelationship[@typeCode='SUBJ']/cda:observationCriteria/cda:value",
            HQMF2::Document::NAMESPACES
          ), 'DIAGNOSIS', fields)
      end

      parse_pq(entry.at_xpath('./cda:lengthOfStayQuantity', HQMF2::Document::NAMESPACES), 'LENGTH_OF_STAY', fields)
      parse_cd(entry.at_xpath('./cda:dischargeDispositionCode', HQMF2::Document::NAMESPACES), 'DISCHARGE_STATUS', fields)

      handle_loc(entry, fields)
    end

    # rubocop:enable Metrics/LineLength

    def self.parse_procedure_fields(entry, fields)
      parse_dset_cd(entry.at_xpath('./cda:methodCode', HQMF2::Document::NAMESPACES), 'METHOD', fields)
      parse_dset_cd(entry.at_xpath('./cda:approachSiteCode', HQMF2::Document::NAMESPACES),
                    'ANATOMICAL_APPROACH_SITE', fields)
      parse_dset_cd(entry.at_xpath('./cda:targetSiteCode', HQMF2::Document::NAMESPACES),
                    'ANATOMICAL_LOCATION_SITE', fields)
    end

    def self.parse_supply_fields(_entry, _fields)
    end

    def self.parse_grouper_fields(_entry, _fields)
    end
  end
end
