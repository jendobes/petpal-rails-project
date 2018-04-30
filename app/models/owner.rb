class Owner < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :rescues
  has_many :pets, through: :rescues

  def rescue_status
    if self.adopter? && self.fosterer?
      "I'm looking to adopt or foster."
    elsif self.adopter?
      "I'm looking to adopt."
    else
      "I'm looking to foster."
    end
  end

end
