class RemoveThemeFromHints < ActiveRecord::Migration
  def change
    remove_column :hints, :theme, :string
  end
end
