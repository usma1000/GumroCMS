class Carrier < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
