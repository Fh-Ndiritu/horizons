FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email}
        user_name {Faker::Internet.user_name}
        password {'123456'}
        after(:create) do |user, ev|
            user.avatar.attach(io: File.open(Rails.root.join('db/images/avatar.jpg')), filename: "avatar.jpg")
        end
    end
end 