class CreateArticleSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :article_seasons do |t|
      t.integer :article_id
      t.integer :season_id

      t.timestamps
    end
    add_index :article_seasons, :article_id
    add_index :article_seasons, :season_id
  end
end
