def find_max_subarray(nums)
    if nums.empty? 
        p "Empty list" #Check if can combine p and return
        return
    end

    max_subarray = 0
    current_subarray = 0

    nums.each do |num|
        current_subarray = current_subarray + num
        current_subarray = 0 if current_subarray < 0
        max_subarray = current_subarray if current_subarray > max_subarray
    end

    max_subarray = nums.max if max_subarray == 0
    p max_subarray
    return max_subarray
end


test1 = [1,-2,3,4,]
test2 = [-1,-3,-4]
test4 = []

find_max_subarray(test4)