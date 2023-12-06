# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


#2 users 
users = []
User.all.destroy_all
3.times do 
    user = FactoryBot.create(:user)
    2.times{ FactoryBot.create(:product, user: user)}
    users << [user.email, user.password]
end

puts "generated users #{users}"
