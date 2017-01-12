require_relative "../code"

describe "def bracket_match?(string)" do
  it "that takes a string and returns true or false based on whether or not the brackets in string match" do
    string1 = "Hi! What is your name again (I forgot)?"
    string2 = "Hi! What is (your name again? I forgot"
    string3 = "{}()[]"
    string4 = "{}()[]("
    string5 = "{}()[](}"
    string6 = "{}{}{()[]}({[]})"


    expect(bracket_match?(string1)).to eq(true)
    expect(bracket_match?(string2)).to eq(false)
    expect(bracket_match?(string3)).to eq(true)
    expect(bracket_match?(string4)).to eq(false)
    expect(bracket_match?(string5)).to eq(false)
    expect(bracket_match?(string6)).to eq(true)
    expect(bracket_match?(string7)).to eq(true)

  end
end
