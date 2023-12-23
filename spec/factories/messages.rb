FactoryBot.define do
  factory :message do
    user
    conversation
    content { Faker::TvShows::GameOfThrones.quote }
  end
end
