class Facility < ActiveRecord::Base
  belongs_to :carrier

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
