require 'test_helper'
class DateShiftTest  < MiniTest::Unit::TestCase

ENTRY_VALUES = [{start_time: nil, end_time: nil, time: nil},
							{start_time: 1, end_time: 1, time: 1},
							{start_time: 1, end_time: nil, time: nil},
							{start_time: nil, end_time: 1, time: nil},
							{start_time: nil, end_time: nil, time: 1},
							{start_time: 1, end_time: 1, time: nil},
							{start_time: 1, end_time: nil, time: 1},
							{start_time: nil, end_time: 1, time: 1},
							]

	def setup
	end


	def test_entry_shift

		date_shift = 1
		values = ENTRY_VALUES.clone
	  values.each do |vals|
	  	entry = Entry.new(vals)
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry)
	  end						


	end

	def test_condition_shift
		date_shift = 13
		values = ENTRY_VALUES.clone
		con_values = [{time_of_death: nil}, {time_of_death: 10}]
		values.each do |vals|
			con_values.each do |con_val|
				e_vals = vals.merge con_val
		  	entry = Condition.new(e_vals)
				entry.shift_dates(date_shift)
				entry_shift_assertions(e_vals,date_shift, entry)
			end
	  end				
	end

	def test_encounter_shift
		date_shift = 10
		values = ENTRY_VALUES.clone
		encounter_values = [{admitTime: nil}, {dischargeTime: nil},
												{admitTime: nil}, {dischargeTime: nil},
												{admitTime: nil}, {dischargeTime: nil},
												{admitTime: nil}, {dischargeTime: nil}]
		facility_values = [{start_time: nil, end_time: 20}]
												
		values.each do |vals|
			encounter_values.each do |enc_vals|
				facility_values.each do |fac_vals|
					e_vals = vals.merge enc_vals
			  	entry = Encounter.new(e_vals)
			  	entry.facility = Facility.new(fac_vals)
					entry.shift_dates(date_shift)
					entry_shift_assertions(e_vals,date_shift, entry) {|ev,ds,ent| entry_shift_assertions(fac_vals,ds,entry.facility)}
				end
			end
	  end				

	end


	def test_facility_shift
		date_shift = 20
		facility_values =  [{start_time: nil, end_time: nil},
												{start_time: 1, end_time: nil},
												{start_time: nil, end_time: 1},
												{start_time: 1, end_time: 1}]
		facility_values.each do |fac_vals|
			facility = Facility.new(fac_vals)
			facility.shift_dates(date_shift)
			entry_shift_assertions(fac_vals,date_shift, facility)
		end

	end

  def test_fullfillment_shift
  	date_shift = 12
  	full_values = [{dispense_date: nil}, {dispense_date: 15}]
  	full_values.each do |vals|
  		fullfillment = FulfillmentHistory.new(vals)
  		fullfillment.shift_dates(date_shift)
  		entry_shift_assertions(vals,date_shift, fullfillment)
  	end
	end


	def test_guarantor_shift
		date_shift = 20
		values =  [{start_time: nil, end_time: nil},
												{start_time: 1, end_time: nil},
												{start_time: nil, end_time: 1},
												{start_time: 1, end_time: 1}]
		values.each do |vals|
			entry = Guarantor.new(vals)
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry)
		end
	end

	def test_insurance_provider_shift

		date_shift = 20
		values =  [{start_time: nil, end_time: nil},
												{start_time: 1, end_time: nil},
												{start_time: nil, end_time: 1},
												{start_time: 1, end_time: 1}]
		values.each do |vals|
			entry = InsuranceProvider.new(vals)
			g_vals = {start_time: nil, end_time: 1}
			g = Guarantor.new(g_vals)
			entry.guarantors << g
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry) {|v,ds,e| entry_shift_assertions(g_vals,date_shift, e.guarantors[0])}
		end
	end


	def test_medical_equipment_shift
		date_shift = 13
		values = ENTRY_VALUES.clone
		con_values = [{removalTime: nil}, {removalTime: 10}]
		values.each do |vals|
			con_values.each do |con_val|
				e_vals = vals.merge con_val
		  	entry = MedicalEquipment.new(e_vals)
				entry.shift_dates(date_shift)
				entry_shift_assertions(e_vals,date_shift, entry)
			end
	  end				
	end	

	def test_medication_shift

		date_shift = 13
		values = ENTRY_VALUES.clone
		ful_hist ={dispense_date: 15}
		order_inf = {orderDateTime: nil, orderExpirationDateTime: 10}
		values.each do |vals|
		  	entry = Medication.new(vals)
		  	entry.fulfillmentHistory << FulfillmentHistory.new(ful_hist)
		  	entry.orderInformation << OrderInformation.new(order_inf)
				entry.shift_dates(date_shift)
				entry_shift_assertions(vals,date_shift, entry) do |vals,ds,ent|
					entry_shift_assertions(ful_hist,date_shift,entry.fulfillmentHistory[0])
					entry_shift_assertions(order_inf,date_shift,entry.orderInformation[0])
				end
	  end				


	end	

	def test_order_information_shift

		date_shift = 20
		values =  [{orderDateTime: nil, orderExpirationDateTime: nil},
								{orderDateTime: nil, orderExpirationDateTime: 10},
								{orderDateTime: 10, orderExpirationDateTime: nil},
								{orderDateTime: 12, orderExpirationDateTime: 10}]
		values.each do |vals|
			entry = OrderInformation.new(vals)
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry)
		end
	end


	def test_procedure_shift

		date_shift = 13
		values = ENTRY_VALUES.clone
		pro_values = [{incisionTime: nil}, {incisionTime: 10}]
		values.each do |vals|
			pro_values.each do |pro_val|
				e_vals = vals.merge pro_val
		  	entry = Procedure.new(e_vals)
				entry.shift_dates(date_shift)
				entry_shift_assertions(e_vals,date_shift, entry)
			end
	  end				
	end

	def test_provider_performance_shift

		date_shift = 20
		values =  [{start_date: nil, end_date: nil},
												{start_date: 1, end_date: nil},
												{start_date: nil, end_date: 1},
												{start_date: 1, end_date: 1}]
		values.each do |vals|
			entry = ProviderPerformance.new(vals)
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry)
		end

	end


	def test_record_shift
		date_shift = 99
		values =  [{birthdate: nil, deathdate: nil},
												{birthdate: 1, deathdate: nil},
												{birthdate: nil, deathdate: 1},
												{birthdate: 1, deathdate: 1}]

		values.each do |vals|
			entry = Record.new(vals)
			entry.shift_dates(date_shift)
			entry_shift_assertions(vals,date_shift, entry)
		end
			
	end


	def entry_shift_assertions(field_values, shift, entry, &block)
		field_values.each_pair do |field,value|
			entry_value = entry.send field.to_sym
			if value.nil?
				assert_equal value, entry_value, "Field should be nil as it was not set before shift"
			else
				assert_equal value + shift, entry_value, "Field #{field} should equal initial value #{value} plus the shift #{shift}"
			end
		end
		#allow a block to be passed in to test embeeded fields of entries like facility
		yield field_values, shift, entry if block_given?
	end

end