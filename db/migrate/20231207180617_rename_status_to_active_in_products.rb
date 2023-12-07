class RenameStatusToActiveInProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :status, :active
  end
end
