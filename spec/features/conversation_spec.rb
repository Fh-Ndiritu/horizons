require 'rails_helper'

RSpec.feature 'Conversations lists', type: :feature do 
    before do
        user = create(:user)
        sign_in(user)
        valid_product = create(:product, title: "First Product")
    end

    scenario "Uses the product as a conversation title" do 
        conversation = create(:conversation, product: valid_product)
        visit conversations_path
        expect(page).to have_text("First Product")
    end

    scenario "Closed/expired product is indicated on conversation" do 
        expired_product = create(:product, title: "First Product", active: false)
        conversation = create(:conversation, product: expired_product)
        visit conversations_path
    end

end