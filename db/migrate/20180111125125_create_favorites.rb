class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
  	drop_table :favorites
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
