FactoryBot.define do
  factory :product do
    title { Faker::Vehicle.make_and_model }
    active {true}
    user
    after(:create) do |product, ev|
      product.images.attach(io: File.open(Rails.root.join('db/images/vintage.jpg')), filename: 'vintage.jpeg')
    end

  end
end
