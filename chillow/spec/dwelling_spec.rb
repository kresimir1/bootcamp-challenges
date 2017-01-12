require 'spec_helper'

describe Dwelling do
  let (:info) {Dwelling.new("New Columbia", "Rockville", "MD", 20905)}
  it 'has an adress' do
    expect(info.adress).to eq("New Columbia")
  end
  it 'has a city/town' do
    expect(info.city).to eq("Rockville")
  end
  it 'has a state' do
    expect(info.state).to eq("MD")
  end
  it 'has a zip code' do
    expect(info.zip_code).to eq(20905)
  end
end
