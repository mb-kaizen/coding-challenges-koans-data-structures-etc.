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

def find_smallest_missing_from_positives(array, size)    
    # Marks visited elems as negative
    (0...size).each do |i|
        val = array[i].abs # .abs needed for already negatively marked elems
        if (val - 1 < size) && (array[val-1] > 0)
            array[val-1] = -array[val-1]
        end
    end

    # Returns first positive (i + 1 because index starts at 0)
    (0...size).each {|i| return i + 1 if array[i] > 0}
    return size + 1
end

def sort_negatives(input, size)
    positive_index = 0 # Keeps track of index of 1st positive element

    (0...size).each do |i|
        if input[i] <= 0
            # Swap <= 0 elem with the earliest positive elem
            input[i], input[positive_index] = input[positive_index], input[i]
            positive_index += 1
        end
    end
    return positive_index
end

def find_missing(array)
    size = array.size

    start_point = sort_negatives(array, size)
    return find_smallest_missing_from_positives(array.drop(start_point), size - start_point)
end

test_input = [
    [1,2,0],
    [3,4,1,1],
    [7,8,-9,11,12],
    [1, 6, 1, 3, 5],
    [1,2,3,0,5]
]

for test in test_input
    p "#{test} ---> #{find_missing(test)}"
end

# find_smallest_missing_from_positives([1,2,3])

