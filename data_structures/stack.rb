module LinkedList
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
			@top = Node.new(value, @top)
		end


		def pop
			raise "Stack is empty" if is_empty?
			value = @top.value
			@top = @top.next_node
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
end

stack = LinkedList::Stack.new

%w[The quick brown fox jumped].each { |i| stack.push(i) }

# stack.view_stack
begin
	p stack.pop while stack
rescue RuntimeError => e 
	p e.message
end