require_relative '../../../test_helper'

class HQMFV1V2RoundtripTest < Test::Unit::TestCase

  def setup
    # Parse the sample file and convert to the model
    hqmf_xml = File.open('test/fixtures/1.0/0033/0033.xml').read
    @v1_model = HQMF::Parser.parse(hqmf_xml, '1.0')
    # serialize the model using the HQMF2 generator back to XML and then
    # reparse it
    hqmf_xml = HQMF2::Generator::ModelProcessor.to_hqmf(@v1_model)
    @v2_model = HQMF::Parser.parse(hqmf_xml, '2.0')
  end

  def test_roundtrip
    v1_json = JSON.parse(@v1_model.to_json.to_json)
    v2_json = JSON.parse(@v2_model.to_json.to_json)

    # remove measure period width
    v1_json['measure_period']['width'] = nil
    
    # remove embedded whitespace formatting in attribute values
    v1_json['attributes'].each do |attr|
      if attr['value']
        attr['value'].gsub!("\r\n", ' ')
      end
    end

    # drop the CMS ID since it does not go into the HQMF v2
    puts "\t CMS ID ingnored in hqmf v2"
    v1_json['cms_id'] = nil

    diff = v1_json.diff_hash(v2_json, true, true)

#     outfile = File.join(".","tmp","v1_v2_diffs.json")
#     File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(JSON.parse(diff.to_json))) }
#     outfile = File.join(".","tmp","v1.json")
#     File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(v1_json)) }
#     outfile = File.join(".","tmp","v2.json")
#     File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(v2_json)) }

    assert diff.empty?, 'Differences in model after roundtrip to HQMF V2'

  end
  
end
