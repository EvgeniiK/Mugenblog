class CreateFavoriteArticles < ActiveRecord::Migration
  def change
    create_table :favorite_articles do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
