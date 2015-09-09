class Facility < ActiveRecord::Base
  belongs_to :carrier

  def self.search(search)
    where("address LIKE ? OR city LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.searchState(searchState)
    where("state LIKE ?", "%#{search}%")
  end
end
