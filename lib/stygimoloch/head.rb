module Stygimoloch
  
class Head < PipelineStep
  def initialize(upstream,lines)
    super(upstream)
    @lines = lines
    @count = 0
  end
  
  def process(line)
    if (@lines > @count)
      @count = @count.succ
      super(line)
    end
    true
  end
end

class Pipeline
  def head(counter)
     @tail = Head.new(@tail,counter)
     self
   end
end

end