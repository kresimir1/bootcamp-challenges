#YOUR CODE GOES HERE

def greatest_common_factor(num1, num2)

  while num1 != 0 && num2 != 0
    if num1 > num2
      num1 = num1 % num2
    else
      num2 = num2 % num1
    end
  end

  if num1 == 0
    return num2
  elsif num2 == 0
    return num1
  end

end
