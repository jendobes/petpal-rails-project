class PetsController < ApplicationController
  before_action :verify_user_is_authenticated, only: [:new,:edit]

  def index
    if params[:select]
      @pets = Pet.send(params[:select])
    end
    @rescued_pets = Pet.rescued
  end

  def high_risk
    @pets = Pet.high_risk
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'pets/new'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end




  private

  # def pet_params
  #   params.require(:pet).permit(:name, :age, :kill_shelter, :gender, :image, :zip_code, :bio, :adopter, :fosterer, :breed, :owner, :species, :search)
  # end

end
