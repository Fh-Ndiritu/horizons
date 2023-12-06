require 'rails_helper'

RSpec.describe Product, type: :model do
     describe 'it has validations' do 
        it 'belongs to a user' do 
            association = described_class.reflect_on_association(:user)
            expect(association.macro).to eq(:belongs_to)
        end
      end
end
