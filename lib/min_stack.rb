require './stack.rb'

class MinStack < Stack
  def initialize
    @min = Stack.new
  end

  def push(num_x)
    # rubocop:disable Style/IdenticalConditionalBranches

    if empty?
      super
      @min.push(num_x)
    else
      super
      num_y = @min.pop
      # Add it again
      @min.push(num_y)
      num_x < num_y ? @min.push(num_x) : @min.push(num_y)
    end
    # rubocop:enable Style/IdenticalConditionalBranches
  end

  def pop
    minimum = super
    @min.pop
    minimum
  end

  def minimum_value
    minimum = @min.pop
    @min.push(minimum)
    minimum
  end
end

minstack = MinStack.new
minstack.push(10)
minstack.push(20)
minstack.push(30)

puts minstack.minimum_value

minstack.push(5)

puts minstack.minimum_value
