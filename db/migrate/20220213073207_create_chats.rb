class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :user_id
      t.integer :room_id
      t.text :content

      t.timestamps
    end

    add_index :chats, :user_id
    add_index :chats, :room_id
    add_index :chats, [:user_id, :user_id], unique: true
  end
end
