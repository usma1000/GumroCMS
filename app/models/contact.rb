class Contact < ActiveRecord::Base
  belongs_to :carrier
  validates :name, :presence => true

  def self.search(search)
    where("lower(name) LIKE ? OR lower(email) LIKE ? OR lower(phone) LIKE ? OR lower(title) LIKE ? OR lower(comments) LIKE ?", "%#{search}%".downcase, "%#{search}%".downcase, "%#{search}%".downcase, "%#{search}%".downcase, "%#{search}%".downcase)
  end
end
