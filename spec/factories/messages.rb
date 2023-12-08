FactoryBot.define do
  factory :message do
    content { Faker::TvShows::GameOfThrones.quote }
    user
    conversation
  end
end
