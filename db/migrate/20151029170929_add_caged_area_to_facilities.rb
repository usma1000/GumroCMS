class AddCagedAreaToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :separate_caged_area_for_gas_tanks, :boolean
    add_column :facilities, :driver_scan, :boolean
    add_column :facilities, :independant_contractors, :boolean
    add_column :facilities, :company_drivers, :boolean
    add_column :facilities, :ratio_independant_company, :string
  end
end
