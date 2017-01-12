#YOUR CODE GOES HERE
def minimum_coins(number)
  values = [1, 5, 10, 25, 50, 100]
  count = 0
  n = values.length - 1

  if number >= 1 && number <= 250
    while number > 0
      if values[n] <= number
        number = number - values[n]
        count += 1
      else
        n -= 1
      end
    end
    count
  else
    "The number must be between 1 and 250"
  end
end
