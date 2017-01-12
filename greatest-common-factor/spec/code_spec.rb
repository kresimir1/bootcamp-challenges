require_relative "../code"

describe "Greatest Common Factor method" do
  it " takes two numbers as arguments and returns the largest number
    that goes evenly into both numbers with no remainder." do
      number1 = 8
      number2 = 4
      expect(greatest_common_factor(number1, number2)).to eq(4)

      number1 = 8
      number2 = 7
      expect(greatest_common_factor(number1, number2)).to eq(1)

      number1 = 81
      number2 = 18
      expect(greatest_common_factor(number1, number2)).to eq(9)

      number1 = 270
      number2 = 192
      expect(greatest_common_factor(number1, number2)).to eq(6)



    end
end
