class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :municipalities do |t|
      t.string :name,           null: false
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
