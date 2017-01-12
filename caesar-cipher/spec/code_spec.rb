require_relative "../code"

describe "caesar_cipher(string, number)" do
  it "it takes a string and a number as an argument and returns a string based
  that has all the characters shifted for the number spaces in alphabet" do
    string1 = "a"
    string2 = "z"
    string3 = "Caesar"
    string4 = "Caesar [-+======]"
    number = 2
    expect(caesar_cipher(string1, number)).to eq("c")
    expect(caesar_cipher(string2, number)).to eq("b")
    expect(caesar_cipher(string3, number)).to eq("Ecguct")
    expect(caesar_cipher(string4, number)).to eq("Ecguct [-+======]")
  end
end
