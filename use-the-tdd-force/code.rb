# YOUR CODE HERE
def plus_two(number)
  result = number + 2
end

def subtract_or_multiply_by_two(number)
  if number < 0
    result = number - 2
  else
    result = number * 2
  end
end

def repeat_last_word(sentence)
  result = sentence + (" ") + sentence.split(" ")[-1]
end

def return_value_of_type(input)

  if input == String
    String
  elsif input == Fixnum
    String
  else
    "input does not match any Ruby class"
  end
end


def raise_standard_error
  raise StandardError
end

def add_five_and_ten(array)
  [5,10].each do |number|
    array << number
  end
end
