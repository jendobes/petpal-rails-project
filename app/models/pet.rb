class Pet < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true, message: "Please upload an image of this pet!"
  has_many :rescues
  has_many :owners, through: :rescues

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
