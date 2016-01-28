class Facility < ActiveRecord::Base
  belongs_to :carrier, dependent: :destroy

  validates :carrier, :address, :city, :state, :size, :terminal_door_count, :hours_of_operation, :average_equipment_age, :ratio_independant_company, :average_theft_rate, :vehicle_count_24, :vehicle_count_26, :vehicle_count_48, :vehicle_count_53, :vehicle_count_sprinter_vans, :vehicle_count_flat_beds, :vehicle_count_reefers, :presence => true

  def self.search(search)
    where("address LIKE ? OR city LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.searchState(searchState)
    where("state LIKE ?", "%#{search}%")
  end
end
