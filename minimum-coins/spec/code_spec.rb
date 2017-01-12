require_relative "../code"

describe "method minimum_coins(number)" do
  it "takes a number as an argument (ranging from 1 to 250) and returns the
    minimum number of coins needed to calculate number" do
    number1 = 35
    number2 = 37
    number3 = 101
    number4 = 251
    number5 = -4
    expect(minimum_coins(number1)).to eq(2)
    expect(minimum_coins(number2)).to eq(4)
    expect(minimum_coins(number3)).to eq(2)
    expect(minimum_coins(number4)).to eq("The number must be between 1 and 250")
    expect(minimum_coins(number5)).to eq("The number must be between 1 and 250")

  end
end
