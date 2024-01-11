# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Rake::Task['ts:configure'].invoke
# Rake::Task['ts:start'].invoke

User.destroy_all
3.times do 
    user = FactoryBot.create(:user)
end

Product.destroy_all
#products 
8.times do 
    product = FactoryBot.create(:product, user: User.first, active: true)
end


#conversations
 Conversation.destroy_all
8.times{ FactoryBot.create(:conversation, product: Product.all.sample)}
# conversation thread
Message.destroy_all
Conversation.all.each do |conversation|
    user = conversation.product.user
    other_user = User.where.not(id: user).sample
    users = [user, other_user]
    8.times do 
        current_user = users.sample
        FactoryBot.create(:message, conversation: conversation, user: current_user )
    end
end



puts "generated users #{User.first.email} #{User.second.email}"
