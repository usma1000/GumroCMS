class AddCagedAreaToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :SeparateCagedAreaForGasTanks, :boolean
  end
end
