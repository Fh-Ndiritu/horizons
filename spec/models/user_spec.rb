require 'rails_helper'
RSpec.describe User, type: :model do 


    describe 'it has validations' do 
        it 'has many products' do 
            association = described_class.reflect_on_association(:products)
            expect(association.macro).to eq(:has_many)
        end
        
    end


end