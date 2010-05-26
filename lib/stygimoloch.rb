require 'stygimoloch/pipeline'
require 'stygimoloch/count'
require 'stygimoloch/head'
require 'stygimoloch/puts'
require 'stygimoloch/pipe'
require 'stygimoloch/capture'

class String
	def cat(&block)
		Stygimoloch::Pipeline.from_file(self).instance_eval(&block).go!
	end
	
	def echo(&block)
		Stygimoloch::Pipeline.from_string(self).instance_eval(&block).go!
	end
end