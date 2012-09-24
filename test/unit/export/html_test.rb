require 'test_helper'

class HTMLTest < MiniTest::Unit::TestCase
  def test_html
    collection_fixtures('records', '_id')
    record = Record.find('4dcbecdb431a5f5878000004')

    result = HealthDataStandards::Export::HTML.export(record)
    
    assert !(result.match /Rosa/).nil? # first
    assert !(result.match /Vasquez/).nil? # last
    assert !(result.match /December 11th, 1980 23:50/).nil? # birthdate
    assert !(result.match /Female/).nil? # gender
    assert !(result.match /Penicillin/).nil? # Penicillin
    assert !(result.match /RxNorm: 70618/).nil? # Penicillin
    assert !(result.match /April 21st, 2010 00:37/).nil? # Penicillin
    assert !(result.match /Live birth/).nil? # Live birth
    assert !(result.match /July 20th, 2010 19:47/).nil? # live birth
    assert !(result.match /BMI/).nil? # BMI
    assert !(result.match /SNOMED-CT: 225171007/).nil? # BMI
    assert !(result.match /February 20th, 2010 11:13/).nil? # BMI
    assert !(result.match /testing/).nil? # BMI Value
    assert !(result.match /severity/).nil? # severity on primigravidia
    assert !(result.match /6736007/).nil? # severity on primigravidia
    
    # require 'fileutils'
    # FileUtils.mkdir_p File.join(".","tmp")
    # outfile = File.join(".","tmp","patient.html")
    # File.open(outfile, 'w') {|f| f.write(result) }
    
  end
  
end