class CreateTechnologyStacks < ActiveRecord::Migration
  def change
    create_table :technology_stacks do |t|
      t.string :name
      t.text :description
      t.string :link
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
