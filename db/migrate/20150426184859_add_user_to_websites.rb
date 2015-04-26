class AddUserToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :user_id, :integer
    add_index :websites, :user_id
  end
end
