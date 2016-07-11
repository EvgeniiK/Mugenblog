class CreateRawData < ActiveRecord::Migration
  def change
    create_table :raw_data do |t|
      t.string :theme
      t.string :command
      t.text :description
      t.text :link

      t.timestamps null: false
    end
  end
end
