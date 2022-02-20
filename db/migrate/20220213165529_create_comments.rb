class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.integer :article_id
      t.text :content

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :article_id
    
  end
end
