require 'rails_helper'
RSpec.describe User, type: :model do 


    describe 'it has validations' do 
        it 'has many products' do 
            association = described_class.reflect_on_association(:products)
            expect(association.macro).to eq(:has_many)
        end
        
    end


    describe 'it has attributes' do 
        it 'has a user name ' do 
            user = build(:user)
            expect(user).not_to be_valid
            expect(user.errors[:user_name]).to include("can't be blank")
        end
    end


end