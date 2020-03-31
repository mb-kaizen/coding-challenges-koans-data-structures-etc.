def find_first_recurring(array)
	visited = {}
	array.each_with_index do |elem, i|
		p visited
		p elem and return if visited.has_value?(elem)
		visited[i] = elem
	end
end

values = [2,3,4,5,22,5,6]

find_first_recurring(values)

# This is O(n) time and space complexity due to having to iterate over the array. 
# .has_key/value? has O(1) time complexity