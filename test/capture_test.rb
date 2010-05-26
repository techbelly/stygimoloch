lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "stygimoloch"
require "test/unit"
require 'rubygems'
require "shoulda"

class CaptureTest < Test::Unit::TestCase

  should "capture lines into an array" do
    captured_lines = []
    
    "test/test_file.txt".cat do
      capture captured_lines
    end
    
    assert_equal 6, captured_lines.length
    
  end
  
end