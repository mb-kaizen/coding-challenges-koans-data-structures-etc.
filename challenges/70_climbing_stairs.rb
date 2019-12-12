def climb_stairs(n)
	return n if n == 0
	previous_count = 1
	current_count = 1

	(n - 1).times do 
		temp = current_count
		current_count += previous_count 
		previous_count = temp
	end

	p current_count
end

climb_stairs(5)
# Time: O(n)
# Space: O(1)