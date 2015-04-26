class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :website_id
      t.string :name

      t.timestamps null: false
    end
    add_index :events, :website_id
    add_index :events, :name
  end
end
