def balanced_integer_array(array, index)
	sum = 0

	array.each_with_index do |elem, i| 
		sum += elem if i < index
		sum -= elem if i > index
	end

	return sum == 0 
end


# ******Test*******
# "0" serving as the placeholder for given index"
regular_case = [1,2,3,0,2,4]
no_left = [0,2,-2]
no_right = [2,-2, 0]

p "regular case"
balanced_integer_array(regular_case, 2)

p "nothing left"
balanced_integer_array(no_left, 0)

p "nothing right"
balanced_integer_array(no_right, 2)

