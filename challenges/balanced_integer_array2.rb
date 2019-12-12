def balanced_array(array)
	return "empty array" if array.empty?

	# Store visited sums going from left and right
	left_sums = {}
	right_sums = {}

	current_sum_left = 0
	current_sum_right = 0
	left_index = 0 
	right_index = array.length - 1

	while left_index < array.length - 1
		# Checks for balance and returns index if true
		if left_index >= right_index
			return left_index if right_sums[left_index + 1] == current_sum_left
			return right_index if left_sums[right_index - 1] == current_sum_right
		end

		current_sum_left = current_sum_left + array[left_index]
		current_sum_right = current_sum_right + array[right_index]
		left_sums[left_index] = current_sum_left
		right_sums[right_index] = current_sum_right

		right_index -= 1
		left_index += 1
	end

	return 0 if current_sum_right == 0
	return array.length - 1 if current_sum_left == 0
	return "no balance point"
end

test_cases = [
	[1,3,100,2,2],
	[3,4,2,1,0],
	[4,11,2,-12,1,6,-1],
	[1,-5,4,20,0],
	[0,0,0,0,19],
	[1,2,3,4,5]
]

test_cases.each {|test_case| p "#{test_case} => #{balanced_array(test_case)}"}
