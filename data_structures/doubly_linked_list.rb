class Node
	attr_reader :data
	attr_accessor :next_node, :previous_node

	def initialize (data:, next_node: nil, previous_node: nil)
		@data = data
		@next_node = next_node
		@previous_node = previous_node
	end

	def has_previous_node?
		@previous_node.nil?
	end

	def has_next_node?
		!@next_node.nil?
	end
end

class Doubly_Linked_List
	def initialize (data)
		@head = Node.new(data: data)
	end

	def insert_node_at_end(data)
		current_node = @head

		while current_node.has_next_node?
			current_node = current_node.next_node
		end

		current_node.next_node = Node.new(data: data, previous_node: current_node)
	end

	def reverse_list
		current_node = @head 
		next_holder = nil
		previous_holder = nil

		while current_node
			next_holder = current_node.next_node
			current_node.next_node = previous_holder
			current_node.previous_node = next_holder
			previous_holder = current_node 
			current_node = next_holder
		end

		@head = previous_holder
	end

	def display
		current_node = @head

		while current_node
			p "prev: #{current_node.previous_node.data}" unless current_node.previous_node.nil?
			p "data: #{current_node.data}" 
			p "next: #{current_node.next_node.data}" unless current_node.next_node.nil?
			p "-----"
			current_node = current_node.next_node
		end
	end
end

first10 = Doubly_Linked_List.new(1)
(2..10).each {|x| first10.insert_node_at_end(x)}
first10.display
p "****************"
first10.reverse_list
first10.display