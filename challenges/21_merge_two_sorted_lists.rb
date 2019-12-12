# Merge two sorted linked lists and return it as a 
# new list. The new list should be made by splicing 
# together the nodes of the first two lists.

# Example:

# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4
# 
def merge_two_lists(l1, l2)
    dummy_head = ListNode.new(0)
    current_node = dummy_head
    order = []
    
    while l1 || l2
        order << l1.val unless l1.nil?
        order << l2.val unless l2.nil?
        
        
        l1 = l1.next if !l1.nil?
        l2 = l2.next if !l2.nil?
    end
    
    # Ruby's sort method uses quick sort giving it O(n log(n))
    order.sort.each do |x|
        current_node.next = ListNode.new(x)
        current_node = current_node.next
    end
    return dummy_head.next
end

# To improve the Big O, I would implement a linked list, 
# traverse the list and insert it at the approporate place.