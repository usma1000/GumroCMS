class AddCarrierToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :carrier, index: true, foreign_key: true
  end
end
