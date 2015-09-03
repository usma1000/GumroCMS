class Contact < ActiveRecord::Base
  belongs_to :carrier

  def self.search(search)
    where("name ILIKE ? OR email ILIKE ? OR phone ILIKE ? OR title ILIKE ? OR carrier_id ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
