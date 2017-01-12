
def print_puzzle(word, guessed_letter = [])
  word.each_char do |char|
    if guessed_letter.include?(char)
      print char
    elsif # in case input is more than one word
      char == " "
      print " "
    else
      print "-"
    end
  end
end


print_puzzle("I was way off with this code at first", ["I", "w", "o"])
