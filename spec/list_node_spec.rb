require_relative '../lib/list_node'

describe ListNode do
  describe '#initialise' do
    let(:value) { 3 }
    let(:node) { ListNode.new(value) }
    let(:next_value) { 5 }
    let(:next_node) { ListNode.new(next_value) }
    let(:new_node) { ListNode.new(value, next_node) }

    it 'returns the correct instance variables when the next node is empty' do
      expect(node.value).to eq value
      expect(node.next_node).to eq nil
    end

    it 'returns the correct instance variables when the next node is passed' do
      expect(new_node.value).to eq value
      expect(new_node.next_node).to eq next_node
      expect(new_node.next_node.value).to eq next_value
    end
  end
end
