module Stygimoloch

class Pipe < PipelineStep
  def initialize(upstream,&block)
    super(upstream)
    @line_wrapper = SingleLineIO.new
    @pipeline = Pipeline.new(@line_wrapper).instance_eval(&block)
  end
  
  class SingleLineIO
    def readline
      raise EOFError if @line.nil?
      r = @line
      @line = nil
      return r
    end
    
    def line=(l)
      @line = l
    end
  end
  
  def process(line)
    @line_wrapper.line = line
    @pipeline.go!
    super(line)
  end
end

class Pipeline
  def pipe(&block)
    @tail = Pipe.new(@tail,&block)
    self
  end
end

end