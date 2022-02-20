class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.string :user_id
      t.integer :room_id

      t.timestamps
    end
    add_index :user_rooms, :user_id
    add_index :user_rooms, :room_id
  end
end
