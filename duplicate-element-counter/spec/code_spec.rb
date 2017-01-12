require_relative "../code"

describe "duplicate_counter(array)" do
  it "should take an array and return a number that represents
    how many duplicate elements were in an array" do
    array1 = [1, 7, 7, 7, 3, 5]
    array2 = [5, 7, 9]
    array3 = [0,-5,-5,33,33,33]
    expect(duplicate_counter(array1)).to eq(2)
    expect(duplicate_counter(array2)).to eq(0)
    expect(duplicate_counter(array3)).to eq(3)

  end
end
