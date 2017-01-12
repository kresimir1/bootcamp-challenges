
def disclaimer
  puts  "***DISCLAIMER***"
  puts "This code may not work the way you expect it to!"
  puts "By using this temperamental program you agree not to sue"
  puts "the pants of its creator."
  puts "***"
  puts ""
end

answer = "n"
while answer != "y"
  disclaimer
  puts "You must accept out disclaimer to proceed! Do you accept? (y/n)"
  answer = gets.chomp
end

puts "3 + 2 = #{rand(6)}"
puts
disclaimer
