# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order and each of their nodes contain a single digit. 
# Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# ******** Brute force  *********

# class Node
# 	attr_accessor :value, :pointer
# 	def initialize(value)
# 		@value = value
# 		@pointer = nil
# 	end

# 	def has_pointer?
# 		!self.pointer.nil?
# 	end
# end

# class LinkedList
# 	def initialize
# 		@head = nil
# 	end

# 	def insert_node(value)
# 		if @head.nil?
# 			@head = Node.new(value)
# 		else
# 			current_node = @head 

# 			while current_node.has_pointer?
# 				current_node = current_node.pointer
# 			end

# 			current_node.pointer = Node.new(value)
# 		end
# 	end

# 	def make_integer
# 		current_node = @head
# 		int_array = Array.new

# 		while current_node
# 			int_array << current_node.value
# 			current_node = current_node.pointer
# 		end

# 		return int_array.reverse.join.to_i
# 	end
# end

# arg1 = 342.to_s.chars.map(&:to_i)
# arg2 = 465.to_s.chars.map(&:to_i)
# input_list1 = LinkedList.new
# input_list2 = LinkedList.new

# arg1.each {|x| input_list1.insert_node(x)}
# arg2.each {|x| input_list2.insert_node(x)}

# first_int = input_list1.make_integer
# second_int = input_list2.make_integer

# sum = first_int + second_int

# input_sum = sum.to_s.chars.map(&:to_i)
# return_list = LinkedList.new
# input_sum.each {|x| return_list.insert_node(x)}

# ********* Good **********

def add_two_numbers(l1, l2)
		# Initialize a dummy head to reduce code. Would be tedious to implement with conditionals otherwise.
    dummy_head = ListNode.new(0)
    current_node = dummy_head
    # The carry is used to add the remainder to the next node if sum > 10
    carry = 0
    
    list1 = l1
    list2 = l2
    
    while list1 || list2 # I thought this was clever. First time I've used this kind of logic in a while loop.
        # Sets x and y for adding sum. If list runs out (==nil), still would return 0. This prevents breaking if lists are different lengths. 
        x = list1.nil? ? 0 : list1.val 
        y = list2.nil? ? 0 : list2.val
        sum = x + y + carry
        carry = sum/10 # Rounds down to nearest integer. Cannot be greater than 1 when adding two single digits. 
        current_node.next = ListNode.new(sum % 10) # Modular gives the single digit (18 => 8)
        current_node = current_node.next # Set the current node to next node
        # Progresses lists forward if has next node.
        list1 = list1.next if list1 != nil 
        list2 = list2.next if list2 != nil   
    end
    
    current_node.val += carry if carry > 0
    return dummy_head.next
end



