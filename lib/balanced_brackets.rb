require_relative './list_node'
require_relative './stack'

class BalancedBrackets
  def balanced_brackets?(string)
    open_bracs = Stack.new
    result = true
    length = string.length

    i = 0
    while i < length
      bracket = string[i]
      #  We only push open brackets onto the stack
      if ['(', '{', '['].include?(bracket)
        open_bracs.push(bracket)
      else
        begin
          break unless get_cases(bracket, open_bracs)
        rescue StandardError
          result = false
          break
        end
      end
      i += 1
    end

    # unclosed open brackets left, so unnested
    result = false unless open_bracs.empty?
    result
  end

  def get_cases(bracket, open_bracs)
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
    # the bracket string is unnested
    open_bracs.pop == bracket
  end
end
