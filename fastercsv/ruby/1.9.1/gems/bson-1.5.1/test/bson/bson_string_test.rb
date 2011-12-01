# encoding:utf-8
require './test/bson/test_helper'
require 'complex'
require 'bigdecimal'
require 'rational'

class BSONTest < Test::Unit::TestCase

  include BSON

  def setup
    @encoder = BSON::BSON_CODER
  end

  def assert_doc_pass(doc, options={})
    bson = @encoder.serialize(doc)
    if options[:debug]
      puts "DEBUGGING DOC:"
      p bson.to_a
      puts "DESERIALIZES TO:"
    end
    assert_equal @encoder.serialize(doc).to_a, bson.to_a
    assert_equal doc, @encoder.deserialize(bson)
  end

  def test_string
    assert_doc_pass({:a => "hello"})
  end

end
