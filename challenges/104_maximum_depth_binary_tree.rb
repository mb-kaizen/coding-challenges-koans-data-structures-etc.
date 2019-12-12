# Given a binary tree, find its maximum depth.

# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

# Note: A leaf is a node with no children.

# Example:

# Given binary tree [3,9,20,null,null,15,7],

#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

# ****** RECURSIVE SOLUTION
def max_depth(root)
    return 0 if root.nil?ls
#     Could handle in one line but below removes many recursive calls on null leafs 
    left_max = root.left.nil? ? 0 : max_depth(root.left) 
    right_max = root.right.nil? ? 0 : max_depth(root.right)
    return 1 + [left_max, right_max].max
end

# One line solution:
# root ? 1 + [max_depth(root.left), max_depth(root.right)].max : 0

# ********* BFS Solution
def max_depth(root)
    return 0 if root.nil?
    max = 0
    
    stack = []
    stack << root    
    value = []
    value << 1
    
    until stack.empty?
        node = stack.pop
        temp = value.pop
        max = [temp, max].max
        
        if node.left
            stack << node.left
            value << temp + 1
        end
        if node.right
            stack << node.right
            value << temp + 1
        end
    end
    
    return max
end