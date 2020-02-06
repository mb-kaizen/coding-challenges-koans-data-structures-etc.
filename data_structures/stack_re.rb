class Node
	attr_accessor :value, :next_node
	def initialize(value, next_node)
		@value = value
		@next_node = next_node
	end	
end

class Stack
	def initialize
		@top = nil
	end

	def push(value)
		@top = Node.new(value, @top) #<-- previous top becomes next
	end

	def pop
		raise "Stack is empty" if is_empty?
		value = @top.value
		@top = @top.next_node
		p value
		return value
	end

	def is_empty?
		@top.nil?
	end

	def view_stack
		current_node = @top
		while current_node
			p current_node.value
			current_node = current_node.next_node
		end
	end

end

stack = Stack.new
%w[The quick brown fox jumped].each { |i| stack.push(i) }
stack.pop
stack.pop
stack.pop
stack.pop
p "----"
stack.view_stack

