require_relative '../lib/stack'

describe Stack do
  stack = Stack.new

  describe '#push' do
    it 'test that values are added to the stack in the right positions' do
      stack.push(3)
      stack.push(5)

      expect(stack.get(0)).to eql(5)
      expect(stack.get(1)).to eql(3)
    end
  end

  describe '#pop' do
    it 'test that values are taken off the stack in the right positions' do
      expect(stack.pop).to eql(5)

      stack.push(2)
      stack.push(7)
      expect(stack.pop).to eql(7)
      expect(stack.pop).to eql(2)
      expect(stack.pop).to eql(3)
    end
  end

  describe '#min' do
    it 'test that the correct minimumm value in the stack is returned' do
      stack.push(3)
      stack.push(5)
      expect(stack.min).to eql(3)

      stack.pop
      stack.push(7)
      expect(stack.min).to eql(3)

      stack.push(2)
      expect(stack.min).to eql(2)
      stack.pop
      expect(stack.min).to eql(3)
    end
  end
end
