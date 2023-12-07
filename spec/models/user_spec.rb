require 'rails_helper'
RSpec.describe User, type: :model do 


    describe 'it has validations' do 
        it 'has many products' do 
            association = described_class.reflect_on_association(:products)
            expect(association.macro).to eq(:has_many)
        end
        
        it 'has many conversation users' do 
            association = described_class.reflect_on_association(:conversation_users)
            expect(association.macro).to eq(:has_many)
        end

        it 'has many conversations through conversation_users' do 
            association = described_class.reflect_on_association(:conversations)
            expect(association.macro).to eq(:has_many)
        end
    end


    describe 'has attributes: ' do 
        it 'has a user name ' do 
            user = build(:user, user_name: nil)
            expect(user).not_to be_valid
            expect(user.errors[:user_name]).to include("can't be blank")
        end


    end


end