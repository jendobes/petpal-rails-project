class PetsController < ApplicationController
  before_action :verify_user_is_authenticated, only: [:new,:edit]

  def index
    @pets = Pet.not_rescued
    @rescued_pets = Pet.rescued
    if params[:species]
      @filtered_pets = Pet.where('speices LIKE ?', "%#{params[:species]}%")
    end
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
    @pet = Pet.create(pet_params)
    redirect_to pet_path(@pet)
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

  def pet_params
    params.require(:pet).permit(:name, :age, :kill_shelter, :gender, :image, :zip_code, :bio, :adopter, :fosterer, :breed, :owner, :species)
  end

end
