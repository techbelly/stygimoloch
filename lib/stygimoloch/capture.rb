module Stygimoloch

class Capture < PipelineStep
  def initialize(upstream,buffer)
    super(upstream)
    @buffer = buffer
  end
  def process(line)
    @buffer << line
    super(line)
  end
end

class Pipeline
  def capture(list)
    @tail = Capture.new(@tail,list)
    self
  end
end

end