class Carrier < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
  has_many :contacts, dependent: :destroy

  has_attached_file :nda, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :nda, :content_type => ["image/jpg", "image/jpeg",
            "image/png", "image/gif", "application/pdf","application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/msword",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "text/plain"]
  validates_attachment_file_name :nda, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /xlsx?\Z/, /docx?\Z/, /txt\Z/]
  def self.search(search)
    where("name LIKE ? OR comments LIKE ?", "%#{search}%", "%#{search}%")
  end
end
