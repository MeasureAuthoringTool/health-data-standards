require 'test_helper'

class TemplateHelperTest < Minitest::Test
  def test_template_finding
    @template_helper = HealthDataStandards::Export::TemplateHelper.new('c32', 'c32')
    erb = @template_helper.template 'show'
    assert erb
    assert erb.filename.match(/.*show.c32.erb/)
    assert erb.src.length > 0
    assert erb.src.include? 'ClinicalDocument'
  end

  def test_partial_finding
    @template_helper = HealthDataStandards::Export::TemplateHelper.new('c32', 'c32')
    erb = @template_helper.partial 'allergies'
    assert erb
    assert erb.filename.match(/.*\_allergies.c32.erb/)
    assert erb.src.length > 0
    assert erb.src.include? 'Allergies/Reactions'
  end

  def test_render
    template_helper = HealthDataStandards::Export::TemplateHelper.new('c32', 'c32')
    rendering_context = HealthDataStandards::Export::RenderingContext.new
    rendering_context.template_helper = template_helper
    entry = Entry.new(:description => 'An allergy', :time => 1234,
                      :codes => {"CPT" => ['1234']})
    xml = rendering_context.render(:partial => 'allergies', :locals => {:entries => [entry]})
    assert xml
    assert xml.length > 0
    assert xml.include? 'An allergy'
    assert xml.include? '2.16.840.1.113883.6.12' # Make sure the CPT OID is there
    assert xml.include? 'CPT' # Make sure the codeSystemName is present
  end
end