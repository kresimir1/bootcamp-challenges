# YOUR CODE HERE


def word_counter(file, number)
  show_number = 0
  h = Hash.new
  file = File.open(file, "r")
  file.each_line { |line|
    words = line.split
    words.each { |word|
      word = word.gsub(/[,()'"]/,'')
      if h.has_key?(word)
        h[word] = h[word] + 1
      else
        h[word] = 1
      end
    }
  }
    h = h.sort_by { |word, count| word }
    h.each do |word|
      if show_number < number
        show_number += 1
        puts "#{word[0]} : #{word[1]}"
      else
        break
      end
    end


end

if ARGV.size == 2
    file = ARGV[0]
    num = (ARGV[1]).to_i
    word_counter(file, num)
else
  puts "Please specify text file and a number of words to be listed"
end

# puts word_counter('poe_usher.txt', 20)
