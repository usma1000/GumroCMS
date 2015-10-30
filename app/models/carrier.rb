class Carrier < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
  has_many :contacts, dependent: :destroy
  validates :name, :presence => true
  
  has_attached_file :nda, styles: { large: "200x200" }
  validates_attachment_content_type :nda, :content_type => ["image/jpg", "image/jpeg",
            "image/png", "image/gif", "application/pdf","application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/msword", 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "text/plain"]
  validates_attachment_file_name :nda, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /xlsx?\Z/, /docx\Z/, /doc\Z/, /txt\Z/]

  has_attached_file :contract, styles: { large: "200x200" }
  validates_attachment_content_type :contract, :content_type => ["image/jpg", "image/jpeg",
            "image/png", "image/gif", "application/pdf","application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/msword", 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "text/plain"]
  validates_attachment_file_name :contract, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /xlsx?\Z/, /docx\Z/, /doc\Z/, /txt\Z/]

  def imagecontract?
    contract_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|pdf|x-png)$}
  end

  def imagenda?
    nda_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|pdf|x-png)$}
  end

  private

  def resize_images
    return false unless image?
  end

  def self.search(search)
    where("lower(name) LIKE ? OR lower(comments) LIKE ?", "%#{search}%".downcase, "%#{search}%".downcase)
  end
end
