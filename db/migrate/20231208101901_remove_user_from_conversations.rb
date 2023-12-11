class RemoveUserFromConversations < ActiveRecord::Migration[7.1]
  def change
    remove_column :conversations, :user_id
  end
end
