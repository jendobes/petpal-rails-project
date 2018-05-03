class Rescue < ActiveRecord::Base
  belongs_to :owner
  belongs_to :pet

  validates :story, presence: true
end
