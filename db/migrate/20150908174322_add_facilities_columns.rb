class AddFacilitiesColumns < ActiveRecord::Migration
  def change
    add_reference :facilities, :carriers, index: true, foreign_key: true
    add_column :facilities, :has_security, :boolean
    add_column :facilities, :has_CCTV, :boolean
    add_column :facilities, :has_fence, :boolean
    add_column :facilities, :has_sprinklers, :boolean
    add_column :facilities, :has_fire_alarm, :boolean
    add_column :facilities, :has_burglar_alarm, :boolean
    add_column :facilities, :has_drop_yard, :boolean
    add_column :facilities, :terminal_door_count, :integer
    add_column :facilities, :hours_of_operation, :integer
    add_column :facilities, :has_GPS, :boolean
    add_column :facilities, :has_alternate_fuel, :boolean
    add_column :facilities, :has_standard_equipment_types, :boolean
    add_column :facilities, :average_equipment_age, :integer
    add_column :facilities, :drivers_are_screened, :boolean
    add_column :facilities, :has_high_driver_turnover, :boolean
    add_column :facilities, :holds_driver_training, :boolean
    add_column :facilities, :average_theft_rate, :integer
    add_column :facilities, :vehicle_count_24, :integer
    add_column :facilities, :vehicle_count_26, :integer
    add_column :facilities, :vehicle_count_48, :integer
    add_column :facilities, :vehicle_count_53, :integer
    add_column :facilities, :vehicle_count_sprinter_vans, :integer
    add_column :facilities, :vehicle_count_flat_beds, :integer
    add_column :facilities, :vehicle_count_reefers, :integer
  end
end
