class Owner < ActiveRecord::Base
  has_secure_password
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :email,
    :presence => {:message => "cannot be blank"},
    :uniqueness => {:message => "is associated with an existing account"}
  validates :bio, presence: true, length: { maximum: 500 }, on: :update
  validates :name, presence: true, on: :update



  has_many :rescues
  has_many :pets, through: :rescues

  #returns owner with the most rescues
  scope :hero, -> { joins(:rescues).group("rescues.owner_id").order("count(rescues.owner_id) desc").limit(1)}

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
