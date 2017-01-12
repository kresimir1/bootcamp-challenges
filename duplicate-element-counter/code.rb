#YOUR CODE GOES HERE

def duplicate_counter(array)
  duplicates_count = array.length - array.uniq.length
  return duplicates_count
end
