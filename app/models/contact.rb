class Contact < ActiveRecord::Base
  belongs_to :carrier

  def self.search(search)
    where("name LIKE ? OR email LIKE ? OR phone LIKE ? OR title LIKE ? OR carrier_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
