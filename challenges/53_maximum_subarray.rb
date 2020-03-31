
# Given an integer array nums, find the contiguous subarray 
# (containing at least one number) which has the largest sum and return its sum.

# Example:

# Input: [-2,1,-3,4,-1,2,1,-5,4],
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
# Follow up:

# If you have figured out the O(n) solution, try coding another solution 
# using the divide and conquer approach, which is more subtle.
# 
# # @param {Integer[]} nums
# @return {Integer}

# I imagine I have to keep a counter and iterate through the array once
# If I add the next element(s), does the count grow or shrink? 
# Maybe I can keep a value like new_high? that also stores the indecies?
def max_sub_array(nums)
	max_so_far = 0
	max_ending_here = 0

	nums.each do |num|
		max_ending_here = max_ending_here + num 
		max_ending_here = 0 if max_ending_here < 0
		max_so_far = max_ending_here if max_so_far < max_ending_here
	end
  
  max_so_far = nums.max if max_so_far == 0 # Takes care if array of negative nums
  return max_so_far  
end

