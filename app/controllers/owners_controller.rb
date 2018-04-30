class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:user_id] = @owner.id
      redirect_to owner_path(@owner)
    else
      render 'owners/new'
    end
  end

  def edit
    @owner = Owner.find(params[:id])
    if @owner != current_user
      redirect_to signin_path
    end
  end

  def update
    @owner = Owner.find_by(id: params[:id])
    @owner.update(owner_params)
    redirect_to owner_path(@owner)
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :image, :bio, :adopter, :fosterer, :zip_code, :password, :password_confirmation)
  end

end
