class Pet < ActiveRecord::Base

  #paperclip image handling
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #validations
  validates :name, :species, :bio, presence: true
  validates :bio, length: { maximum: 500 }

  #DB relationships
  has_many :rescues
  has_many :owners, through: :rescues
  belongs_to :shelter

  #returns high risk pets who are elderly or in a kill shelter
  scope :high_risk, -> { where("age > ?", 5).or(where(kill_shelter: true))}

  #scoping methods
  def self.rescued
    Rescue.all.map{|r| r.pet}
  end

  def self.not_rescued
    Pet.all - Pet.rescued
  end

  def rescue_status
    if self.adopter? && self.fosterer?
      "Adopt me or foster me!"
    elsif self.adopter?
      "Adopt me, I'm looking for a forever home!"
    else
      "I'm looking for a foster home!"
    end
  end

  def self.dogs
    Pet.where(species: 'Dog')
  end

  def self.cats
    Pet.where(species: 'Cat')
  end



end
