class AddCarrierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :carrier_name, :string
  end
end
