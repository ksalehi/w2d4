require 'byebug'
require_relative 'stack_queue.rb'

def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_with_index do |el, idx|
    w = window_size - 1
    break if w + idx == array.length
    current_window = array[idx..w + idx]
    current_range = current_window.max - current_window.min
    current_max_range = current_range if current_max_range.nil? || current_range > current_max_range
  end
  current_max_range
end

def max_range_q(array, window_size)
  array_dup = array.dup
  max_range = nil
  stack_q = StackQueue.new
  until array_dup.empty?
    stack_q.enqueue(array_dup.shift)
    # byebug
    if stack_q.size == window_size
      if max_range.nil? || stack_q.max - stack_q.min > max_range
        max_range = stack_q.max - stack_q.min
      end
      stack_q.dequeue
    end
  end
  max_range
end

p max_range_q([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p max_range_q([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p max_range_q([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p max_range_q([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
