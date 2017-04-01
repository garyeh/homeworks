class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    idx = @map.index { |el| el.first == key }
    if idx.nil?
      @map << [key, value]
    else
      @map[idx] = [key, value]
    end
    [key, value]
  end

  def lookup(key)
    idx = @map.index { |el| el.first == key }
    @map[idx] if idx
  end

  def remove(key)
    @map.reject! { |el| el.first == key }
    key
  end

  def show
    @map
  end
end
