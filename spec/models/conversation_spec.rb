require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'it has validations' do 
    it 'belongs to a product' do 
      association = described_class.reflect_on_association(:product)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
