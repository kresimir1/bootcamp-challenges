require "simplecov"
SimpleCov.start
require "pry"
require_relative "../code"

# YOUR TEST CODE HERE
describe "perimeter" do
  it "should multiple height by 4 if width is nil" do
    result = perimeter(4)
    expect(result).to eq(16)
  end
  it "should sum the height multiplied by 2 with width multiplied by 2" do
    result = perimeter(2,2)
    expect(result).to eq(8)
  end
end


describe "average" do
  it "calculate the sum of elements of the list" do
    result = average([4, 5, 4, 5])
    expect(result).to eq(4.5)
  end
end

describe "rankings" do
  it "takes a list of strings and outputs the elements with the ranking number in seperate lines" do
    result = rankings(["John", "Paul", "George", "Ringo"])
    expect(result).to eq("1. John\n2. Paul\n3. George\n4. Ringo\n")
  end
end

describe "greet" do
  it "takes a name and greets in spanish" do
    result = greet('Pablo', 'spanish')
    expect(result).to eq(puts 'Hola Pablo!')
  end
  it "takes a name and greets in italian" do
    result = greet("Maria", "italian")
    expect(result).to eq(puts "Ciao Maria!")
  end
  it "takes a name and greets in french" do
    result = greet("Pierre", "french")
    expect(result).to eq(puts "Bonjour Pierre!")
  end
  it "takes a name and greets" do
    result = greet("John")
    expect(result).to eq(puts "Hi John!")
  end
end

describe "print_puzzle" do
  it "prints charactes for the letter guessed or underscore for not guessed in the word" do
    result = print_puzzle("kresimir", ["k", "r", "e", "s", "i", "m"])
    expect(result).to eq("kresimir")
  end
  it "prints charactes for the letter guessed or underscore for not guessed in the word" do
    result = print_puzzle("a", ["a"])
    expect(result).to eq("a")
  end
end

describe "divisible_by_three" do
  it "checks if number is divisible_by_three" do
    expect(divisible_by_three(9)).to eq(true)
  end
  it "checks if number is divisible_by_three" do
    expect(divisible_by_three(7)).to eq(false)
  end
end

describe "perfect_square?" do
  it "raises ArgumentError if number is less than 1" do
  expect{perfect_square?(-3)}.to raise_error(ArgumentError)
  end
  it "returns true if number is perfect_square" do
  expect(perfect_square?(4)).to eq(true)
  end
  it "returns false if number is not perfect_square" do
  expect(perfect_square?(5)).to eq(false)
  end
end
