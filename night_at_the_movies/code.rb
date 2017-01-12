require 'time'

class Movie
  attr_accessor :name, :genre, :start_time

  def initialize(row_hash)
    @name = row_hash[:name]
    @genre = row_hash[:genre]
    @start_time = Time.parse(row_hash[:start_time].strip)
  end

  def showing_after?(arrival_time)
    @start_time >= Time.parse(arrival_time)
  end

  def showing_between?(early_time, late_time)
    @start_time.between?(Time.parse(early_time), Time.parse(late_time))
  end

  def comedy?
    @genre == 'Comedy'
  end

  def to_s
    "#{@name} is a #{@genre} film and starts at #{@start_time.strftime("%-l:%M %p")}"
  end
end

movies = [
  { name: "The Princess Bride", genre: "Comedy", start_time: "7:00PM" },
  { name: "Troll 2", genre: "Horror", start_time: "7:30PM" },
  { name: "Pet Cemetery", genre: "Horror", start_time: "8:15PM" },
  { name: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM" },
  { name: "Teen Witch", genre: "Comedy", start_time: "8:20PM" },
  { name: "The Goonies", genre: "Comedy", start_time: "8:30PM" },
  { name: "Better Off Dead", genre: "Comedy", start_time: "8:45PM" },
  { name: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM" },
  { name: "The Wizard", genre: "Adventure", start_time: "9:10PM" }
]

movie_objects = []

movies.each do |movie_hash|
  movie_objects << Movie.new(movie_hash)
end

#test 1
movie_objects.each do |movie|
  if movie.showing_between?("8:00 PM", "9:00 PM")
    puts movie
  end
end
