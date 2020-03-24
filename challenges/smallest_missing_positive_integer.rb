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


# approach the opposite way to save time. Each elem in checker array,check input array for itself. If it doesn't contain, return self.

# This is space efficient but O(n^2) time

# def return_smallest_missing_postive_integer(input)
#     (1..input.size).each {|num| return num unless input.include? num}
#     return "Array is complete."
# end

def sort_negatives(input)
    postive_index = 0
    
    (0...input.size).each do |i|
        if input[i] <= 0
            input[i], input[postive_index] = input[postive_index], input[i]
            postive_index += 1
        end
    end

    return positive_index
end

def find_smallest_missing_from_positives(array)
    size = array.size
    
    # if all positives, will mark all sequentially checked values
    (0...size).each do |i|
        val = array[i]
        if (val - 1 < size) && (array[val-1] > 0)
            # p val
            array[val-1] = -array[val-1]
        end
    end

    (0...size).each do |i|
        if array[i] > 0
            return i + 1
        end
    end
    # p "Nothing missing."
end

test_input = [
    [1,2,4],
    [3,4,1,1],
    [7,8,9,11,12],
    [1, 6, 1, 3, 5],
    [1,2,3,5]
]

# for test in test_input
#     p "#{test} ---> #{return_smallest_missing_postive_integer(test)}"
# end


for test in test_input
    p "#{test} ---> #{find_smallest_missing_from_positives(test)}"
end

# find_smallest_missing_from_positives([1,2,3])

