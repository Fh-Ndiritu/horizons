class Conversation < ApplicationRecord
  belongs_to :product
  has_many :messages, dependent: :destroy
  ThinkingSphinx::Callbacks.append(self, :behaviours => [:real_time])
  # after_create_commit ->{broadcast_append_to("conversations", partial: "conversations/conversation", locals: {conversation: self}, target: "conversations")}
end
