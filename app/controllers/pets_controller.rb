class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(pet_params)
    redirect_to pet_path(@pet)
  end



  private

  def pet_params
    params.require(:pet).permit(:name, :gender, :image, :zip_code, :bio, :adopter, :fosterer, :breed, :owner, :species)
  end

end
