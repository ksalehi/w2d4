

def first_anagram?(word1, word2)
  options = word1.chars.permutation(word1.length)
  options.each do |option|
    return true if word2 == option.join
  end
  false
end

def second_anagram?(a, b)
  word1 = a.chars
  word2 = a.chars
  a.each_char.with_index do |char, i|
    if word2.include?(char)
      word1.delete_at(word1.find_index(char))
      word2.delete_at(word2.find_index(char))
    end
  end
  word1.empty? && word2.empty?
end

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  hash = Hash.new(0)
  word1.chars.each do |char|
    hash[char] += word1.count(char)
    hash[char] -= word2.count(char)
  end

  hash.values.all? { |val| val.zero? }

end
