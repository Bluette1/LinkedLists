class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

module LinkedList
  # setup head and tail
  @head = nil
  @tail = nil

  def add(number)
    new_node = Node.new(number)
    if @head.nil?
      @head = new_node
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
    new_node = Node.new(item)

    # Either we are adding at the front, in the middle, or at the back of the list

    if index.zero?
      # Add the new node to the front of the list
      new_node.next_node = @head
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
        raise "Can't delete an inexistent node"

      # Check if the next node is the last node, meaning we're deleting at the end of the list
      elsif next_node.next_node.next_node.nil?
        next_node.next_node = nil
        @tail = next_node
      else
        next_node.next_node = next_node.next_node.next_node

      end
    end
  end
end

class Stack
  include LinkedList

  def push(number)
    # We push items onto the stack at the front of the list
    add_at(0, number)
  end

  def pop
    # We pop items off the stack from the front of the list(index 0)
    item = get(0)
    remove(0)
    item
  end

  def empty? # one bracket is unnested
    @head.nil? ? true : false
  end
end

def balanced_brackets?(string)
  open_bracs = Stack.new
  result = true
  length = string.length

  i = 0
  while i < length
    bracket = string[i]
    #  We only push open brackets onto the stack
    if bracket == '(' || bracket == '{' || bracket == '['
      open_bracs.push(bracket)
    else
      begin
        case bracket
        when ')'
          if open_bracs.pop != '(' # the bracket string is unnested
            result = false
            break
          end
        when '}'
          if open_bracs.pop != '{' # the bracket string is unnested
            result = false
            break
          end
        when ']'
          if open_bracs.pop != '[' # the bracket string is unnested
            result = false
            break
          end
          end
      rescue => exception
        result = false
        break
      end
    end
    i += 1
  end

  # unclosed open brackets left, so unnested
  result = false if !open_bracs.empty?

  result
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
