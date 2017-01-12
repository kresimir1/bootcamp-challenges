FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "Restaurant" }
    address "a street"
    city "City"
    state "MD"
    zip "20904"
    description "A description of a restaurant"
  end
end
