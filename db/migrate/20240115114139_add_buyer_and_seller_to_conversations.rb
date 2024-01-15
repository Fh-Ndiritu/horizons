class AddBuyerAndSellerToConversations < ActiveRecord::Migration[7.1]
  def change
    add_column :conversations, :started_by, :integer
    add_column :conversations, :replied_by, :integer
  end
end
