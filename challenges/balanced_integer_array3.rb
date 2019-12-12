test_cases = [
	[1,3,100,2,2],
	[3,4,2,1,0],
	[4,11,2,-12,1,6,-1],
	[1,-5,4,20,0],
	[0,0,0,0,19],
	[1,2,3,4,5]
]

def check_for_balance(array)
	sum_left = 0
	sum_right = 0

	array.reverse_each {|elem| sum_right += elem}
	array.each_with_index do |elem, index|
		return index if sum_left == sum_right - sum_left - elem
		sum_left += elem
	end
	return "no balance point"
end

test_cases.each {|test_case| p "#{test_case} => #{check_for_balance(test_case)}"}