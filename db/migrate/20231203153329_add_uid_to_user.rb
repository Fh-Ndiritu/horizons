class AddUidToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :uid, :text
  end
end
