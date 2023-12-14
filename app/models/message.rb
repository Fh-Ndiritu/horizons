class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  ThinkingSphinx::Callbacks.append(self, :behaviours =>[:real_time])
end
