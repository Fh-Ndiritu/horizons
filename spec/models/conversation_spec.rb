require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'it has validations' do 
    it 'belongs to a product' do 
      association = described_class.reflect_on_association(:product)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many conversation users' do 
      association = described_class.reflect_on_association(:conversation_users)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many users through conversation_users' do 
      association = described_class.reflect_on_association(:users)
      expect(association.macro).to eq(:has_many)
  end

  end
end
