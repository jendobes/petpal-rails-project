class Owner < ActiveRecord::Base
  has_secure_password
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :email, :presence => true, message: "You must enter an email"
  validates :email, :uniqueness => true, message: "Hmm, this email has already been used to create an account..."


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
