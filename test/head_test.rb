lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "stygimoloch"
require "test/unit"
require 'rubygems'
require "shoulda"

class HeadTest < Test::Unit::TestCase

  should "only send a certain number of lines downstream" do
    before_counter = Stygimoloch::Counter.new
    after_counter = Stygimoloch::Counter.new
    
    "test/test_file.txt".cat do
      count before_counter
      head 3
      count after_counter
    end
    
    assert_equal 6, before_counter.count
    assert_equal 3, after_counter.count
    
  end
  
end