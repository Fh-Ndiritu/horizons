require 'rails_helper'

RSpec.describe Message, type: :model do
  describe ' it has validations' do 
    it 'belongs to a conversation' do 
      association = described_class.reflect_on_association(:conversation)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a user' do 
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

  end
end
