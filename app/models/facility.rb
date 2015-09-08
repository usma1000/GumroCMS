class Facility < ActiveRecord::Base
  belongs_to :carrier

  def self.search(search)
    where("address LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
