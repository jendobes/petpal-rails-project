class Foster < ActiveRecord::Base
  belongs_to :owner
  belongs_to :pet
end
