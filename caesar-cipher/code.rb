# #YOUR CODE GOES HERE


def shift_char(character, base, number)
  (((character.ord - base) + number) % 26 + base).chr
end

def caesar_cipher(string, number)
  string.chars.map do |character|
    case character
    when 'a'..'z'
      shift_char(character, 'a'.ord, number)
    when 'A'..'Z'
      shift_char(character, 'A'.ord, number)
    else
      character
    end
  end.join
end
