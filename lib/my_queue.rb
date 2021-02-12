require_relative './linked_list'

class MyQueue < LinkedList
  # include LinkedList

  # We add items to the queue at the back of the list
  # The add method already exists in the linked list

  def take_off
    # We pop items off the queue from the front of the list(index 0)
    item = -1
    unless @head.nil?
      item = get(0)
      remove(0)
    end
    item
  end
end
