class PetsController < ApplicationController
  before_action :verify_user_is_authenticated, only: [:new,:edit]
  before_action :find_pet, only: [:show, :edit, :update]

  def index
    if params[:select]
      @pets = Pet.send(params[:select])
    end
  end

  def high_risk
    @pets = Pet.high_risk
  end

  def show
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
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end




  private

    def pet_params
      params.require(:pet).permit(:name, :age, :kill_shelter, :gender, :image, :zip_code, :bio, :adopter, :fosterer, :breed, :owner, :species, :search, :shelter_id)
    end

    def find_pet
      @pet = Pet.find(params[:id])
    end

end
