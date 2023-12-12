require 'rails_helper'

RSpec.feature 'Conversations lists', type: :feature do 
    let(:user){create(:user, user_name: "Jane Doe")}
    let(:user_two){create(:user, user_name: "John Doe")}

    before(:each) do
        sign_in(user)
    end

    scenario "Uses the product as a conversation title" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        create(:message, user: user, conversation: conversation)
        visit conversations_path
        expect(page).to have_text("First Product")
    end

    scenario "Closed/expired product is indicated on conversation" do 
        expired_product = create(:product, title: "First Product", active: false)
        conversation   = create(:conversation, product: expired_product)
        create(:message, user: user, conversation: conversation)
        visit conversations_path
        expect(page).to have_text("Closed Ad")
    end

    scenario "It displays the other chat member in title" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        create(:message, user: user, conversation: conversation)
        create(:message, user: user_two, conversation: conversation)
        visit conversations_path
        expect(page).to have_text("John Doe")
    end
    
    scenario "It displays part of the most recent chat message" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        message = create(:message, content: "I would buy it for 350", user: user, conversation: conversation)
        visit conversations_path
        expect(page).to have_text("I would buy it for 350")
    end

    scenario 'It lists all the messages in the conversation/chats' do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        message = create(:message, content: "I would buy it for 350", user: user_two, conversation: conversation)
        message = create(:message, content: "That will be too low", user: user, conversation: conversation)
        visit conversations_path
        click_link("#conversation_#{conversation.id}")
        expect(page).to have_text("I would buy it for 350")
        expect(page).to have_text("That will be too low")
        
    end

    # scenario 'It has a search function' do 
    #     visit conversations_path
    #     expect(page).to have_text("")
    # end
    



end