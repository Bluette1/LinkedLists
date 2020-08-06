require_relative '../lib/linked_list'

describe LinkedList do
  list = LinkedList.new

  describe "#add" do
    it "returns correct value at a given index" do
      list.add(3)
      list.add(5)

      expect(list.get(1)).to eql(5)

    end
  end
  describe "#add_at" do

    it "test that values are added at the correct specified index" do 
        list.add_at(1, 11)
        list.add_at(0, 13)
        puts list.print_all
        expect(list.get(2)).to eql(11)
        expect(list.get(0)).to eql(13)
        expect(list.get(1)).to eql(3)
        expect(list.get(3)).to eql(5)
    end
  end

  describe "#print_all" do

    it "test that all the values in the list are returned" do 
      expect(list.print_all).to eql('13 3 11 5')
    end
  end

  describe "#remove" do

    it "test that values are deleted in the right positions" do 
        list.remove(2)
        list.remove(0)
        list.remove(1)

        expect(list.print_all).to eql('3')
    end
  end

  describe "#empty?" do
    it "returns false when the list is not empty" do 

      expect(list.empty?).to eql(false)
   end

    it "returns true when all values are removed" do 
      list.add_at(0, 13)
      list.add(11)
      list.add(5)

        n = 3
      until  n.negative?
        list.remove(n)
        n -= 1
      end
      expect(list.empty?).to eql(true)
    end
  end
end