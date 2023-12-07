FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email}
        user_name {Faker::Internet.user_name}
        password {'123456'}
    end
end 