#YOUR CODE GOES HERE

def minimum_consecutive_integers(array)
  array.sort!
  first_element = array[0]
  last_element = array[-1]
  range = (last_element - first_element) + 1
  return range - array.size


end
