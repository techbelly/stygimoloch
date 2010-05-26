module Stygimoloch

class Puts < PipelineStep
  def initialize(upstream,io)
    super(upstream)
    @io = io
  end
  def process(line)
    @io.puts(line)
    super(line)
  end
end

class Pipeline
  def puts(stream = $stdout)
     @tail = Puts.new(@tail,stream)
     self
   end
end

end