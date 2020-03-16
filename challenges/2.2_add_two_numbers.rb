def add_two_numbers(l1, l2)
    dummy_head = ListNode.new(0)
    current_node = dummy_head

    carry = 0

    list1 = l1
    list2 = l2

    while list1 || list2
        x = list1.nil? ? 0 : list1.val
        y = list2.nil? ? 0 : list2.val
        sum = x + y + carry

        carry = sum/10
        current_node.next = ListNode(sum % 10)

        current_node = current_node.next

        list1 = list1.next if list1 != nil 
        list2 = list2.next if list2 != nil
    end

    current_node.val += carry if carry > 0
    return dummy_head.next
end