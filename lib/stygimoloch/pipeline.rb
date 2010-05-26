require 'stringio'

module Stygimoloch
  
class PipelineStep
	def initialize(upstream=nil) 
		self.upstream = upstream
		if (upstream)
			upstream.downstream = self
		end
	end
	
	def read
	  if @upstream
	    @upstream.read
	  end
	end
	
	def process(record)
	  if @downstream
	    @downstream.process(record)
	  else
	    true
	  end
	end
	
	def upstream
	  @upstream || self
	end
	
	def upstream=(step)
	  @upstream = step
	end
	
	def downstream=(step)
	  @downstream = step
	end
	
end

class IOSource < PipelineStep
	def initialize(io)
	  super(nil)
		@io = io
	end
	
	def read
	  begin
	    line = @io.readline
	    @downstream.process(line)
    rescue EOFError
      return false
    end
	end
end

class Pipeline
  def initialize(io)
    @tail = IOSource.new(io)
  end
  
  def self.from_file(name)
    Pipeline.new(File.new(name))
  end
  
  def self.from_string(string)
    Pipeline.new(StringIO.new(string))
  end
  
  def go!
    {} while (@tail.read)
  end
end

end