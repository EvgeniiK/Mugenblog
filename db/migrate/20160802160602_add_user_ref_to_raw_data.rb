class AddUserRefToRawData < ActiveRecord::Migration
  def change
    add_reference :raw_data, :user, index: true, foreign_key: true
  end
end
