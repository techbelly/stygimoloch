lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "stygimoloch"
require "test/unit"
require 'rubygems'
require "shoulda"

class CounterTest < Test::Unit::TestCase

  should "count the lines in a file" do
    counter = Stygimoloch::Counter.new
    "test/test_file.txt".cat do
      count counter
    end
    assert_equal 6, counter.count
  end
  
end
