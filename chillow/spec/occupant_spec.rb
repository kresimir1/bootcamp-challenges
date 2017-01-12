require 'spec_helper'

describe Occupant do
  let(:occupant) {Occupant.new("Peter", "O'Toole")}
  it "has a first name" do
    expect(occupant.first_name).to eq("Peter")
  end

  it "has a last name" do
    expect(occupant.last_name).to eq("O'Toole")
  end
    
end
