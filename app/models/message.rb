class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_rich_text :content
  has_many_attached :files
  default_scope { order(created_at: :asc)}
  ThinkingSphinx::Callbacks.append(self, :behaviours =>[:real_time])
include ActionText::Attachable
  # app/views/users/_mention.html.erb 
  # rendered in final rendering
  def to_attachment_partial_path
    "messages/attachments"
  end



    after_create_commit -> { broadcast_append_to "chat_messages", partial: "messages/message", locals: { message: self, current_user: self.user } , target: "chat_messages"}

  # after_update_commit -> { 
  #   broadcast_replace_to "chat_messages", 
  #   partial: "messages/message",
  #   locals: {  message: self , current_user: self.user},
  #   target: "chat_messages" 
  # }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }





end
