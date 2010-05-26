module Stygimoloch
  
  class Count < PipelineStep
    def initialize(upstream,counter)
      super(upstream)
      @counter = counter
    end
    def process(line)
      @counter.succ!
      super(line)
    end    
  end
  
  class Counter
    def initialize
      @count = 0
    end
  
    def succ!
      @count = @count.succ
    end
  
    def count
      @count
    end
  end
  
  class Pipeline
    def count(counter)
      @tail = Count.new(@tail,counter)
      self
    end
  end
end