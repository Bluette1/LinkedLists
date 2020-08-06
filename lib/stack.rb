require_relative './linked_list'

class Stack < LinkedList
  def push(number)
    # We push items onto the stack at the front of the list -
    # think of a stack of plates
    add_at(0, number)
  end

  def pop
    # We pop items off the stack from the front of the list(index 0)
    item = get(0)
    remove(0)
    item
  end

  def min
    # Iterate the stack list  search of a minimum value
    next_node = @head
    min = next_node.value

    until next_node.nil?
      min = next_node.value if next_node.value < min
      next_node = next_node.next_node
    end
    min
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3

# Testing min stack
stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3
