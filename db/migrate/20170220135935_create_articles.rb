class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.belongs_to :user

      t.timestamps null: false
    end

    create_join_table :tags, :articles, id: false do |t|
      t.index :tag_id
      t.index :article_id
    end
  end
end
