require './my_queue.rb'

class MaxQueue < MyQueue
  def initialize
    @max = MyQueue.new
  end

  def add(num_x)
    # rubocop:disable Style/IdenticalConditionalBranches
    if empty?
      super
      @max.add(num_x)
    else
      super
      @max.remove_last while !@max.empty? && @max.tail.value < num_x
      @max.add(num_x)

    end
    # rubocop:enable Style/IdenticalConditionalBranches
  end

  def take_off
    value = super
    @max.take_off if @max.head == value
    value
  end

  def maximum_value
    @max.head.value
  end
end

maxqueque = MaxQueue.new
maxqueque.add(10)
maxqueque.add(20)
maxqueque.add(30)

puts maxqueque.maximum_value

maxqueque.add(40)

puts maxqueque.maximum_value
