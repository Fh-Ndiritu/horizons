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

        page.find_link("conversation_#{conversation.id}").click
        expect(page).to have_text("I would buy it for 350")
        expect(page).to have_text("That will be too low")
        
    end

    describe 'it has a search function: ' do 
        before do 
            visit conversations_path
        end

        scenario 'It has a search form' do 
            expect(page).to have_text("Search Messages")
        end

        scenario 'It returns conversations with message content' do 
            conversation = create(:conversation)
            create(:message, content: "Very unique product you have", user: user_two, conversation: conversation)
            fill_in("query", with: "unique product you")
            click_on("Search")
            expect(page).to have_content("Very unique product")
        end

        scenario 'It returns conversations based on user name' do 
            conversation = create(:conversation)
            new_user = create(:user, user_name: "Monica Hall")
            create(:message, content: "Very unique name ...", user: new_user, conversation: conversation)
            fill_in("query", with: "Monica Hall")
            click_on("Search")
            expect(page).to have_content("Monica Hall")
            expect(page).to have_content("Very unique name")
        end

        scenario 'It returns conversations based on product name' do 
            valid_product = create(:product, title: "Caraxes")
            conversation = create(:conversation, product: valid_product)
            create(:message,  user: user, conversation: conversation)
            fill_in("query", with: "Caraxes")
            click_on("Search")
            expect(page).to have_content("Caraxes")
        end

        
    end

    describe 'it shows messages in conversations' do 
         scenario 'it groups chats by date of conversation' do 
            valid_product = create(:product, user: user)
            conversation = create(:conversation, product: valid_product)
            create(:message, user: user_two, conversation: conversation)

            visit conversations_path
            page.find_link("conversation_#{conversation.id}").click
            expect(page).to have_text("Today")
        end

        scenario 'user can add a new message', focus: do 
            conversation = create(:conversation)
            message = create(:message, conversation: conversation)

            visit conversations_path
            click_on("conversation_#{conversation.id}")

            msg = "Thanks for reaching out about ... "
            find("trix-editor").click.set(msg)
            click_on("Send")

            expect(page).to have_text(msg)
        end


    end


end