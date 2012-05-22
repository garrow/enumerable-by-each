module Enumerable 
  def injekt accum, &block
    each { |x| 
      yield accum, x if block_given?
    }
    return accum
  end

  def chart *args, &block
    set = []
    each do |x|
      if block_given?
        r = yield x
        set << r
      end
    end
    return set
  end

  def enny? *args, &block
    if block_given?
        each do |x|
          pred = yield x
          return true if pred
        end
    else 
        return enny? {|x|x}
    end
    false
  end
 
  def everything? *args, &block
    if block_given?
        each do |x|
            pred = yield x
            return false unless pred
        end
    else
        return everything? {|x|x }
    end
    return true
  end


end

