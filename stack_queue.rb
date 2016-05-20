require_relative 'queue'
require_relative 'stack'

class StackQueue

  attr_reader :store
  def initialize
    @store = MyStack.new
  end

  def enqueue(el)
    store.push(el)
  end

  def dequeue
    temp_stack = MyStack.new
    until store.size == 1
      temp_stack.push(store.pop)
    end
    el = store.pop
    store.max, store.min = nil, nil
    until temp_stack.empty?
      store.push(temp_stack.pop)
    end
    el
  end

  def peek
    store.peek
  end

  def size
    store.size
  end

  def max
    store.max
  end

  def min
    store.min
  end

  def empty?
    store.empty?
  end
end
