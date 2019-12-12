# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
 

# But the following [1,2,2,null,3,null,3] is not:

#     1
#    / \
#   2   2
#    \   \
#    3    3
#    

# This solution works for many but not for some null edgecases such as [2,3,3,4,5,5,4,null,null,8,9,null,null,9,8]
#

# def is_symmetric(root)
#     bf_stack = bfs(root)
#     sym_test = []
#     return bf_stack
#     while bf_stack.size > 1
#         if bf_stack.last != sym_test.last
#             sym_test << bf_stack.pop
#         else
#             sym_test.pop
#             bf_stack.pop
#         end
#     end
#     # return sym_test
#     return sym_test.size == 0 ? true : false
# end

# def bfs(node)
#     queue = []
#     stack = []
#     queue.push(node)
# #     try putting condition if both children are null
#     while queue.size != 0
#         n = queue.shift 
#         if n.nil?
#             stack << nil
#         else
#             stack << n.val
#             # unless n.left.nil? && n.right.nil?
#                 queue << n.left
#                 queue << n.right
#             # end
#         end
#     end
            
#     return stack
# end

def is_symmetric(root)
    isMirror(root, root)
end

def isMirror(root1, root2)
	return true if root1.nil? && root2.nil?
	return false if root1.nil? || root2.nil?

    if root1.val == root2.val
        return (isMirror(root1.left, root2.right) and isMirror(root1.right, root2.left))
    else
        return false
    end
end