require_relative '../lib/my_queue'

describe MyQueue do
  describe '#take_off' do
    let(:queue) { MyQueue.new }
    it 'test that values are taken off the queue in the right positions' do
      queue.add(3)
      queue.add(5)

      expect(queue.take_off).to eql(3)

      queue.add(2)
      queue.add(7)

      expect(queue.take_off).to eql(5)
      expect(queue.take_off).to eql(2)
      expect(queue.take_off).to eql(7)
    end
  end
end
