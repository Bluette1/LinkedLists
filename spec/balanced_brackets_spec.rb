require_relative '../lib/balanced_brackets'

describe BalancedBrackets do
  balanced_brackets = BalancedBrackets.new

  describe "#balanced_brackets?" do
    it "test samples" do

      expect(balanced_brackets.balanced_brackets?('(hello)[world]')).to eql(true)
      expect(balanced_brackets.balanced_brackets?('([)]')).to eql(false)
      expect(balanced_brackets.balanced_brackets?('[({}{}{})([])]')).to eql(true)

    end
  end
end