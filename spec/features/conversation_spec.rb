require 'rails_helper'

RSpec.feature 'Conversations lists', type: :feature do 
    before do
        user = create(:user, user_name: "John Doe")
        sign_in(user)
    end

    scenario "Uses the product as a conversation title" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        visit conversations_path
        expect(page).to have_text("First Product")
    end

    scenario "Closed/expired product is indicated on conversation" do 
        expired_product = create(:product, title: "First Product", active: false)
        conversation = create(:conversation, product: expired_product)
        visit conversations_path
        expect(page).to have_text("Closed Ad")
    end

    scenario "It displays the other chat member in title" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        visit conversations_path
        expect(page).to have_text("John Doe")
    end
    
    scenario "It displays part of the most recent chat message" do 
        valid_product = create(:product, title: "First Product")
        conversation = create(:conversation, product: valid_product)
        visit conversations_path
        expect(page).to have_text("I would buy it for 350, 000")
    end
    



end