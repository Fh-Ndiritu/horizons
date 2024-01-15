class Message < ApplicationRecord
  after_save_commit :set_participants
  belongs_to :user
  belongs_to :conversation
  has_rich_text :content
  has_many_attached :files
  scope :asc, -> { order(created_at: :asc)}
  ThinkingSphinx::Callbacks.append(self, :behaviours =>[:real_time])

  include ActionText::Attachable
  def to_attachment_partial_path
    "messages/attachments"
  end

  after_create_commit -> { 
    broadcast_append_to "messages_#{self.created_at.to_date}", 
    partial: "messages/message", 
    locals: { message: self, current_user: self.user } ,
    target: "messages_#{self.created_at.to_date}"
  }

  after_update_commit -> { 
    broadcast_update_to self, 
    partial: "messages/message", 
    locals: { message: self, current_user: self.user } ,
    target: self
  }
  
  after_destroy_commit -> { broadcast_remove_to "messages_#{self.created_at.to_date}" }

  scope :unread, ->{where.not(read: true)}
  scope :other_users, ->(current_user){where.not(user: current_user)}


  private

  def set_participants  
    if self.conversation.replied_by.nil? && self.conversation.started_by != self.user.id
          self.conversation.update replied_by: self.user.id
    end
  end






end
