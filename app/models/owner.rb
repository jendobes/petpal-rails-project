class Owner < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :adoptions
  has_many :fosters
  has_many :pets, through: :adoptions
  has_many :pets, through: :fosters

end
