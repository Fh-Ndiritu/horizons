class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_rich_text :content
  default_scope { order(created_at: :asc)}

  ThinkingSphinx::Callbacks.append(self, :behaviours =>[:real_time])
end
