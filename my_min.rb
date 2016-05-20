# phase 1

def my_min_1(array)
  min = nil
  array.each_with_index do |el1, idx1|
    min = el1 if array.all? { |el| el1 <= el }
  end
  min
end

def my_min_2(array)
  min = nil
  array.each do |el|
    min = el if min.nil? || el < min
  end
  min
end

def contig_subsum_1(array)
  subarrays = []
  start = 0
  (start..array.length - 1).each do |start|
    finish = 0
    (finish..array.length - 1).each do |finish|
        subarrays << array[start..finish]
      finish += 1
    end
    start += 1
  end
  subarrays.reject! { |e| e.empty? }

  subarrays.map do |subarray|
    subarray.inject(:+)
  end.max

end

def contig_subsum_2(array)
  largest_sum = nil
  current_sum = array[0]
  finder = 1
  while finder < array.length
    if current_sum + array[finder] > 0
      current_sum += array[finder]
      largest_sum = current_sum if largest_sum.nil? || current_sum > largest_sum
    else
      largest_sum = current_sum
      current_sum = 0
    end
    finder += 1

  end
  largest_sum
end
