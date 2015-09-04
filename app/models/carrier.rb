class Carrier < ActiveRecord::Base
  has_many :facilities

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
