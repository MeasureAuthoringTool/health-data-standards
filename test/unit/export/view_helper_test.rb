require 'test_helper'

class ViewHelperTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::ViewHelper

  def test_code_display
    entry = Entry.new(:description => 'bacon > cheese', :time => 1234,
                      :codes => {"CPT" => ['1234']})
    code_xml = code_display(entry)
    assert ! code_xml.include?('bacon > cheese')
    assert code_xml.include?('bacon &gt; cheese')
  end
end