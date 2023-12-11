class Conversation < ApplicationRecord
  belongs_to :product
  has_many :messages, dependent: :destroy

end
