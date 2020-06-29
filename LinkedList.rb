class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
			@value = value
      @next_node = next_node
    end
  end
  
  class LinkedList
    #setup head and tail
    @head = nil
    @tail = nil
  
    def add(number)
      new_node = Node.new(number)
      if @head == nil
				@head = new_node
				@tail = new_node
      else
				# insert the node at the end of the list / tail
				@tail.next_node = new_node
				@tail = new_node
      end
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
  end
  
  list = LinkedList.new
  
  list.add(3)
  list.add(5)
  puts list.get(1)
  # => 5