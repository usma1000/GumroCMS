class AddCarrierIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :carrier_id, :integer
    add_index :contacts, :carrier_id
  end
end
