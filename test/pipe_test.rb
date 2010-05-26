lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "stygimoloch"
require "test/unit"
require 'rubygems'
require "shoulda"

class PipeTest < Test::Unit::TestCase

  should "create a parallel branched pipeline" do
    before_counter = Stygimoloch::Counter.new
    pipe_counter = Stygimoloch::Counter.new
    after_counter = Stygimoloch::Counter.new
    
    "test/test_file.txt".cat do
      count before_counter
      pipe do
        head 3
        count pipe_counter
      end
      count after_counter
    end
    
    assert_equal 6, before_counter.count
    assert_equal 3, pipe_counter.count
    assert_equal 6, after_counter.count
    
  end
  
end