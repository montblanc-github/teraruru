class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :article_id
      t.string :visiter_id
      t.string :visited_id
      t.integer :comment_id
      t.string :action
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
