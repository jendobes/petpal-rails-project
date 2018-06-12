class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :breed, :bio
  has_many :rescues
end
