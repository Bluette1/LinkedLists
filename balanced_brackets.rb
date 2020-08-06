require_relative "./list_node"
require_relative "./stack"

def balanced_brackets?(string)
  open_bracs = Stack.new
  result = true
  length = string.length

  i = 0
  while i < length
    bracket = string[i]
    #  We only push open brackets onto the stack
    if bracket == '(' || bracket == '{' || bracket == '['
      open_bracs.push(bracket)
    else
      begin
        case bracket
        when ')'
          if open_bracs.pop != '(' # the bracket string is unnested
            result = false
            break
          end
        when '}'
          if open_bracs.pop != '{' # the bracket string is unnested
            result = false
            break
          end
        when ']'
          if open_bracs.pop != '[' # the bracket string is unnested
            result = false
            break
          end
        end
      rescue => exception
        result = false
        break
      end
    end
    i += 1
  end

  # unclosed open brackets left, so unnested
  result = false if !open_bracs.empty?

  result
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
