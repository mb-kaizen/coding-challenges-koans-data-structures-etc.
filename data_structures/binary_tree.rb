class Node
	attr_reader :data 
	attr_accessor :left_node, :right_node
	
	def initialize (data, left_node=nil, right_node=nil)
		@data = data
		@left_node = left_node
		@right_node = right_node
	end

	def has_left_node?
		!@left_node.nil?
	end	

	def has_right_node?
		!@right_node.nil?
	end

	def children
		[@left_node, @right_node].compact
	end

	def children?
		@left_node && @right_node
	end

	def no_children?
		!children?
	end
end

class Binary_Tree
	def initialize (data)
		@root = Node.new(data)
	end

	def insert_node (data)
		@data = data
		@current_node = @root

		find_insertion_point
	end

	def find_insertion_point
		if @data <= @current_node.data
			if @current_node.has_left_node?
				@current_node = @current_node.left_node
				find_insertion_point
			else
				@current_node.left_node = Node.new(@data)
			end
		else
			if @current_node.has_right_node?
				@current_node = @current_node.right_node
				find_insertion_point
			else
				@current_node.right_node = Node.new(@data)			
			end
		end
	end

	def bfs
		queue = []
		queue.push(@root)

		while(queue.size != 0)
			n = queue.shift
			p n.data
			n.children.each {|child| queue.push(child)}
		end
	end
end

numbers = [26, 3, 5, 15, 4, 27]

tree = Binary_Tree.new(10)
numbers.each {|x| tree.insert_node(x)}
tree.bfs
