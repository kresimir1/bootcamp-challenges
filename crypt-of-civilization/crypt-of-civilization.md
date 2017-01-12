##  Crypt Creation

We're going to build ourselves a time capsule - like the [Crypt of Civilization](http://en.wikipedia.org/wiki/Crypt_of_Civilization) - using Ruby arrays!

Write a line of code that initializes an empty array called
`crypt_of_civilization`

{% show_solution %}
```ruby
crypt_of_civilization = Array.new
```

or

```ruby
crypt_of_civilization = []
```
{% endshow_solution %}

## Crypt Filling

Now let's start adding items to the `crypt_of_civilization`!
Based on the array we initialized above, let's add the following items to the array:

* A Comptometer
* A box of phonographic records
* A plastic savings bank
* A set of scales
* A Toast-O-Lator
* A sample of aluminum foil
* A Donald Duck doll

What is a Toast-O-Lator you might ask? Here is an answer:
[https://www.youtube.com/watch?v=eS6HfCN2eLQ](https://www.youtube.com/watch?v=eS6HfCN2eLQ)

For a full inventory of the time capsule, take a look here:
[http://crypt.oglethorpe.edu/inventory/](http://crypt.oglethorpe.edu/inventory/)

{% show_solution %}
```ruby
crypt_of_civilization << "Comptometer"
crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "plastic savings bank"
crypt_of_civilization << "set of scales"
crypt_of_civilization << "Toast-O-Lator"
crypt_of_civilization << "sample of aluminum foil"
crypt_of_civilization << "Donald Duck doll"
```
{% endshow_solution %}

## Crypt Combining

Oh no! We forgot to add a few items to `crypt_of_civilization`! We have another
array called `extra` that has a few items:

```ruby
extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
```

After defining the `extra` array like we've done above,
write a single line of Ruby code that combines the contents of
`crypt_of_civilization` and extra into `crypt_of_civilization`.

{% show_solution %}
```ruby
#provided code
extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]

crypt_of_civilization = crypt_of_civilization + extra
```
{% endshow_solution %}

## Crypt Reference

Now let's grab a few values in the `crypt_of_civilization` variable.
Write a single line of code to answer each of the following questions:

* How many items are in the array?
* What is the first item in the array?
* What is the last item in the array?
* What is the second item in the array?
* What is the third item in the array?
* What is the second from last item in the array?
* What is the index of "Toast-O-Lator"?

{% show_solution %}

How many items are in the array:

```ruby
crypt_of_civilization.length
```

What is the first item in the array?

```ruby
crypt_of_civilization[0]
```

or

```
crypt_of_civilization.first
```

What is the last item in the array?

```ruby
crypt_of_civilization[-1]
crypt_of_civilization.last
```

What is the second item in the array?

```ruby
crypt_of_civilization[1]
```

What is the third item in the array?

```ruby
crypt_of_civilization[2]
```

What is the second from last item in the array?

```ruby
crypt_of_civilization[-2]
```

What is the index of "Toast-O-Lator"?

```ruby
crypt_of_civilization.index("Toast-O-Lator")
```

{% endshow_solution %}

## Crypt Checking

Let's find out if our array `crypt_of_civilization` contains some items!

Write Ruby code to answer the following questions:
* Does the array contain "container of beer"?
* Does the array contain "Toast-O-Lator"?
* Does the array contain "plastic bird"?

{% show_solution %}
```ruby
crypt_of_civilization.include?("container of beer")
crypt_of_civilization.include?("Toast-O-Lator")
crypt_of_civilization.include?("plastic bird")
```
{% endshow_solution %}

## Crypt Printing

Two hundred years have passed. Hoverboards STILL haven't been properly invented
yet, but at least we can open up our time capsule and enjoy a well-aged
container of beer!

Using a `while` loop, print out each element of the array `crypt_of_civilization`.
Do the same with an `each` loop!

{% show_solution %}
```ruby
count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end

crypt_of_civilization.each do |item|
  puts item
end
```
{% endshow_solution %}

## Crypt Deletion

After opening the time capsule we discovered that half of this stuff is junk!
History won't mind if we get rid of a few relics.

Remove the following items from the array `crypt_of_civilization`:

* "Comptometer"
* "set of scales"
* "sample of aluminum foil"

{% show_solution %}
```ruby
crypt_of_civilization.delete("Comptometer")
crypt_of_civilization.delete("set of scales")
crypt_of_civilization.delete("sample of aluminum foil")
```
{% endshow_solution %}

Good job, you've successfully preserved a record of our society (or at least some of it)!
