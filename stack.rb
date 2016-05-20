class MyStack
  attr_reader :store
  attr_accessor :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def push(el)
    store << el
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
  end

  def pop
    store.pop
  end

  def peek
    store.last
  end

  def size
    store.size
  end

  def max
    @max
  end

  def min
    @min
  end

  def empty?
    store.empty?
  end
end
