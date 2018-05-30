class Shelter < ActiveRecord::Base
  has_many :pets

  validates :website, :name, presence: true
end
