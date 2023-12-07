class Conversation < ApplicationRecord
  belongs_to :product

  has_many :conversation_users, dependent: :destroy
  has_many :users, through: :conversation_users


  def others(current_user) 
    self.users.where.not(id: current_user.id)
  end

end
