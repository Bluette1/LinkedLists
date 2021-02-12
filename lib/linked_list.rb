require_relative './list_node'

class LinkedList
  # setup head and tail
  @head = nil
  @tail = nil

  def add(number)
    new_node = ListNode.new(number)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      # insert the node at the end of the list / tail
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def get(index)
    next_node = @head
    idx = 0
    while idx < index
      next_node = next_node.next_node
      idx += 1
    end

    next_node.value
  end

  def print_all
    next_node = @head
    idx = 0
    until next_node.nil?
      p idx.to_s + ': ' + next_node.value.to_s
      next_node = next_node.next_node
      idx += 1
    end
  end

  def add_at(index, item)
    new_node = ListNode.new(item)

    # Either we are adding at the front, in the middle, or at the back of the list

    if index.zero?
      # Add the new node to the front of the list
      new_node.next_node = @head
      @tail = new_node if @head.nil?
      @head = new_node
    else
      next_node = @head
      idx = 0

      # Traverse until the node just before the insert index
      while idx < index - 1
        next_node = next_node.next_node
        idx += 1
      end

      # idx = index - 1
      # insert the new node after this position

      # Check if the next node is nil, meaning we're inserting at the end of the list
      if next_node.next_node.nil?
        # insert the node at the end of the list / tail
        next_node.next_node = new_node
        @tail = new_node
      else
        new_node.next_node = next_node.next_node
        next_node.next_node = new_node
      end
    end
  end

  def remove(index)
    # Either we are removing from the front, in the middle, or at the back of the list

    if index.zero?
      # Remove the node from the front of the list
      new_head = @head.next_node
      @head.next_node = nil
      @head = new_head
    else
      next_node = @head
      idx = 0

      # Traverse until the node just before the delete index
      while idx < index - 1
        next_node = next_node.next_node
        idx += 1
      end

      # idx = index - 1
      # delete the node after this position

      # Check if the next node is nil, meaning we're deleting a node which does not exist
      if next_node.next_node.nil?
        puts "Can't delete an inexistent node"

      # Check if the next node is the last node, meaning we're deleting at the end of the list
      elsif next_node.next_node.next_node.nil?
        next_node.next_node = nil
        @tail = next_node
      else
        next_node.next_node = next_node.next_node.next_node

      end
    end
  end

  def empty?
    @head.nil?
  end
end
