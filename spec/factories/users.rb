FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email}
        user_name {Faker::TvShows::GameOfThrones.character}
        password {'123456'}
        after(:create) do |user, ev|
            user.avatar.attach(io: File.open(Rails.root.join('db/images/avatar.jpg')), filename: "avatar.jpg")
        end
    end
end 