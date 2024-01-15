FactoryBot.define do
  factory :conversation do
    product
    started_by {product.user}
  end
end
