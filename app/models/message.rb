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



end
