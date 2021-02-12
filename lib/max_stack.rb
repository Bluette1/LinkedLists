require './stack.rb'

class MaxStack < Stack
  def initialize
    @max = Stack.new
  end

  def push(num_x)
    # rubocop:disable Style/IdenticalConditionalBranches
    if empty?
      super
      @max.push(num_x)
    else
      super
      num_y = @max.pop
      # Add it again
      @max.push(num_y)
      num_x > num_y ? @max.push(num_x) : @max.push(num_y)
    end
    # rubocop:enable Style/IdenticalConditionalBranches
  end

  def pop
    minimum = super
    @max.pop
    minimum
  end

  def maximum_value
    minimum = @max.pop
    @max.push(minimum)
    minimum
  end
end

maxstack = MaxStack.new
maxstack.push(10)
maxstack.push(20)
maxstack.push(30)

puts maxstack.maximum_value

maxstack.push(40)

puts maxstack.maximum_value
