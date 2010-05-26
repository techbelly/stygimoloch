lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "stygimoloch"
require "test/unit"
require 'rubygems'
require "shoulda"

class PutsTest < Test::Unit::TestCase

  should "output lines to a stream" do
     s = StringIO.new
    
    "test/test_file.txt".cat do
      head 2
      puts s
    end
    
    s.rewind
    assert_equal "one\ntwo,buckle my shoe\n",s.read
    
  end
  
end