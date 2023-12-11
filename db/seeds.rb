# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
users  = []
2.times do 
    user = FactoryBot.create(:user)
    users << [user.email, user.password]
end

Product.destroy_all
#products 
2.times{ FactoryBot.create(:product, user: User.first, active: true)}
#conversations
 Conversation.destroy_all
4.times{ FactoryBot.create(:conversation, product: Product.all.sample)}
# conversation thread
Message.destroy_all
Conversation.all.each do |conversation|
    User.all.each do |user|
        FactoryBot.create(:message, conversation: conversation, user: user)
    end
    
end



puts "generated users #{users}"
