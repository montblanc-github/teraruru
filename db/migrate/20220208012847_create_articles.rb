class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id,              null: false, index: true
      t.string :article_image_id
      t.string :cultivar_name,         null: false
      t.integer :prefecture_id,        null: false, index: true
      t.integer :municipality_id,      null: false, index: true
      t.string :level,                 null: false
      t.string :season,                null: false
      t.boolean :fertilizer_existence, null: false
      t.string :fertilizer_info
      t.string :place,                 null: false
      t.string :condition,             null: false
      t.string :state_at_start,        null: false
      t.text :message,                 null: false

      t.timestamps
    end
  end
end
