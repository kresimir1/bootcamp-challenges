require_relative "../code"

describe "Minimum Consecutive Integers (array))" do
  it "it takes an array of integers and returns the minimum number of integers
    required to make array consecutive" do
    list1 = [1, 3]
    list2 = [2, 5]
    list3 = [-1, 2, 4]
    list4 = [4, 7, -6, 13, 18]

    expect(minimum_consecutive_integers(list1)).to eq(1)
    expect(minimum_consecutive_integers(list2)).to eq(2)
    expect(minimum_consecutive_integers(list3)).to eq(3)
    expect(minimum_consecutive_integers(list3)).to eq(3)
  end
end
