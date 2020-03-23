# Given an unsorted integer array, find the smallest missing positive integer.

# Example 1:

# Input: [1,2,0]
# Output: 3
# Example 2:

# Input: [3,4,-1,1]
# Output: 2
# Example 3:

# Input: [7,8,9,11,12]
# Output: 1

# Input: [1, 0, 1, -3, 5]
# Output: 2

# Initialize array the size of input filled with consecutive positive integers. As I iterate over input, drop elem in compare array if matched with input. Return first elem in array as it will be smallest

def return_smallest_missing_postive_integer(input)
    checker_array = (1..input.size).to_a

    input.each do |elem|
        if checker_array.include? elem
            checker_array = checker_array - [elem]
        end
    end

    return checker_array.first
end

test_input = [
    [1,2,0],
    [3,4,-1,1],
    [7,8,9,11,12],
    [1, 0, 1, -3, 5]
]

for test in test_input
    p "#{test} ---> #{return_smallest_missing_postive_integer(test)}"
end

