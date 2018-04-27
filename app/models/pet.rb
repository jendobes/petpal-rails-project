class Pet < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :rescues
  has_many :owners, through: :rescues

  def rescue_status
    if self.adopter? && self.fosterer?
      "Adopt me or foster me!"
    elsif self.adopter?
      "Adopt me, I am looking for a forever home!"
    else
      "I am looking for a foster home!"
    end
  end

end
