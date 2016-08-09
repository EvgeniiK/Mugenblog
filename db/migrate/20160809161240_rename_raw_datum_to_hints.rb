class RenameRawDatumToHints < ActiveRecord::Migration
  def change
    rename_table :raw_data, :hints
  end
end
