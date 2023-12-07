FactoryBot.define do
  factory :product do
    title { Faker::Vehicle.make_and_model }
    active {true}
    user
  end
end
