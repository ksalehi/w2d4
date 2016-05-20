def bad_two_sum?(array, target)

  array.each_with_index do |el, idx|
    array.each_with_index do |el2, idx2|
      next if idx == idx2
      return true if el + el2 == target
    end
  end
  false
end

# this is O(n^2)

def okay_two_sum?(array, target)
  array.sort!
  array.each_with_index do |el, idx|
    array2 = array.dup
    array2.delete_at(idx)
    return true if array2.include?(target - el)
  end
  false
end

def two_sum?(array, target)
  hash = Hash.new
  array.each do |el|
    hash[el] = true
  end

  array.each do |el|
    find = target - el
    return true if hash.has_key?(find)
  end
end
