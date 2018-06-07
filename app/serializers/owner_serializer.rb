class OwnerSerializer < ActiveModel::Serializer
  attributes :id
  has_many :rescues
end
