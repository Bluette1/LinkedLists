require_relative './list_node'
require_relative './stack'

class BalancedBrackets
  def balanced_brackets?(string)
    open_bracs = Stack.new
    result = true

    i = 0
    while i < string.length
      bracket = string[i]
      #  We only push open brackets onto the stack
      if ['(', '{', '['].include?(bracket)
        open_bracs.push(bracket)
      elsif open_bracs.empty? || !get_cases(bracket, open_bracs)
        result = false
        break
      end
      i += 1
    end

    # unclosed open brackets left, so unnested
    result = false unless open_bracs.empty?
    result
  end

  def get_cases(bracket, open_bracs) # rubocop:todo Metrics/CyclomaticComplexity
    result = true
    case bracket
    when ')'
      result = false unless check_bracket open_bracs, '('
    when '}'
      result = false unless check_bracket open_bracs, '{'
    when ']'
      result = false unless check_bracket open_bracs, '['
    end
    result
  end

  def check_bracket(open_bracs, bracket)
    open_bracs.pop == bracket
  end
end
