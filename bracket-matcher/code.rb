#YOUR CODE GOES HERE


def bracket_match?(string)
  stack = []
  string.each_char do |char|
    case char
    when '{', '[', '('
      stack.push(char)
    when '}'
      x = stack.pop
      return false if x != '{'
    when ']'
      x = stack.pop
      return false if x != '['
    when ')'
      x = stack.pop
      return false if x != '('
    end
  end
  stack.empty?
end
