class Conversation < ApplicationRecord
  belongs_to :product
  has_many :messages, dependent: :destroy
  ThinkingSphinx::Callbacks.append(self, :behaviours => [:real_time])
end
