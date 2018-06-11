class RescueSerializer < ActiveModel::Serializer
  attributes :id, :story, :owner_id, :pet_id
end
