class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_join_table :tags, :hints, id: false do |t|
      t.index :tag_id
      t.index :hint_id
    end
  end
end
