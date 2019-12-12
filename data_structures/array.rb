arr = Array.new 
numbers = [1,2,3,4]
letters = %w[a b c d]

numbers.each_with_index do |n, i|
	arr << [n, letters[i + 1]]
end

p arr