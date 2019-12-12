class Node
	attr_reader :data 
	attr_accessor :pointer

	def initialize (data, pointer=nil)
		@data = data
		@pointer = pointer
	end

	def has_pointer?
		!@pointer.nil?
	end
end

class Singly_Linked_List
	def initialize(data)
		@head = Node.new(data)
	end

	def insert_node_at_end(data)
		current_node = @head

		while current_node.has_pointer?
			current_node = current_node.pointer
		end

		current_node.pointer = Node.new(data)
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

	def display
		current_node = @head

		while current_node.has_pointer?
			p current_node.data
			current_node = current_node.pointer
		end

		p current_node.data
	end
end

first10 = Singly_Linked_List.new(1)
(2..10).each { |x| first10.insert_node_at_end(x) }
first10.display
first10.reverse_list
first10.display

