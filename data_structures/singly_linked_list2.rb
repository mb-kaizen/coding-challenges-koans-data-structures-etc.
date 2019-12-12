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

	def push(value)
		current_node = @head
		while current_node.pointer
			current_node = current_node.pointer
		end
		current_node.pointer = Node.new(value)
	end

	def reverse_list
		current_node = @head
		next_node = nil
		previous_node = nil

		while current_node
			next_node = current_node.pointer
			current_node.pointer = previous_node
			previous_node = current_node
			current_node = next_node # This makes current node = nil, breaking out of while loop
		end

		@head = previous_node
	end

	def print_list
		current_node = @head 

		while current_node
			p current_node.value
			p "----"
			current_node = current_node.pointer
		end
	end

end

list = LinkedList.new("start")
(1..5).each {|x| list.push(x)}

list.reverse_list
list.print_list