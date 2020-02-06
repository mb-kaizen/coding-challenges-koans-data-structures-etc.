class Node
	attr_accessor :value, :pointer

	def initialize(value)
		@value = value
		@pointer
	end

end

class LinkedList

	def initialize(value)
		@head = Node.new(value)
	end

	def move_to_last_node
		current_node = @head
		while current_node.pointer
			current_node = current_node.pointer
		end
		return current_node
	end

	def push(value)
		move_to_last_node.pointer = Node.new(value)
	end

	def reverse_list
		current_node = @head
		next_node = nil
		previous_node = nil

		while current_node
			next_node = current_node.pointer
			current_node.pointer = previous_node
			previous_node = current_node
			current_node = next_node
		end

		@head = previous_node
	end

	def print_list
		current_node = @head

		while current_node
			p current_node.value
			current_node = current_node.pointer
		end
	end

end

list = LinkedList.new("start")
%w[first second third fourth].each {|x| list.push(x)}
list.print_list
p "------"
list.reverse_list
list.print_list