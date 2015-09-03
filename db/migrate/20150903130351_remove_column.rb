class RemoveColumn < ActiveRecord::Migration
  def up
    remove_column :contacts, :carrier_id
  end

  def down
    add_column :contacts, :carrier_id, :integer
  end
end
