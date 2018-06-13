class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :breed, :bio, :rescues, :avatar
  #has_many :rescues

  def rescues
    object.rescues.map{|r| {story: r.story}}
  end


end
