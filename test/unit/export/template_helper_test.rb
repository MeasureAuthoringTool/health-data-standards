require 'test_helper'

class TemplateHelperTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::TemplateHelper

  def test_template_finding
    self.template_format = 'c32'
    erb = template 'show'
    assert erb
    assert erb.length > 0
    assert erb.include? 'ClinicalDocument'
  end

  def test_partial_finding
    self.template_format = 'c32'
    erb = partial 'allergies'
    assert erb
    assert erb.length > 0
    assert erb.include? 'Allergies/Reactions'
  end

  def test_render
    self.template_format = 'c32'
    entry = Entry.new(:description => 'An allergy', :time => 1234,
                      :codes => {"CPT" => ['1234']})
    xml = render(:partial => 'allergies', :locals => {:entries => [entry]})
    assert xml
    assert xml.length > 0
    assert xml.include? 'An allergy'
    assert xml.include? '2.16.840.1.113883.6.12' # Make sure the CPT OID is there
  end
end