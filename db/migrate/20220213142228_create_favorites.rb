class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :user_id
      t.integer :article_id

      t.timestamps
    end

    add_index :favorites, :user_id
    add_index :favorites, :article_id
    add_index :favorites, [:user_id, :article_id], unique: true
  end
end
