# Crypt Filling
crypt_of_civilization = []
crypt_of_civilization << "A Comptometer"
crypt_of_civilization << "A box of phonographic records"
crypt_of_civilization << "A plastic savings bank"
crypt_of_civilization += ["A set of scales", "Toast-O-Lator", "sample of aluminium foil", "Donald Duck doll"]
# Crypt Combining
extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = crypt_of_civilization + extra
puts crypt_of_civilization.inspect

#crypt reference
puts crypt_of_civilization.size
puts crypt_of_civilization.first
puts crypt_of_civilization.last


puts crypt_of_civilization[1]
puts crypt_of_civilization[2]
puts crypt_of_civilization[-2]
puts crypt_of_civilization.index("Toast-O-Lator")
#Crypt Checking
puts crypt_of_civilization.include?("container of beer")
puts crypt_of_civilization.include?("Toast-O-Lator")
puts crypt_of_civilization.include?("plastic bird")
# crypt printing
a = 0
while a < crypt_of_civilization.length
  puts crypt_of_civilization[a]
  a += 1
end
# or with each do method
crypt_of_civilization.each do |item|
  puts item
end
#Crypt Deletion
crypt_of_civilization.delete("A Comptometer")
crypt_of_civilization.delete("A set of scales")
crypt_of_civilization.delete("sample of aluminium foil")
puts crypt_of_civilization.inspect
