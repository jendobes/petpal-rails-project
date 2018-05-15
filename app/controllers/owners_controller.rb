class OwnersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update]

  def show

  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:user_id] = @owner.id
      redirect_to edit_owner_path(@owner)
    else
      render 'owners/new'
    end
  end

  def edit
    if @owner != current_user
      redirect_to signin_path
    end
  end

  def update
    @owner.update(owner_params)
    if @owner.save
      redirect_to owner_path(@owner)
    else
      render 'owners/edit'
    end
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :email, :image, :bio, :adopter, :fosterer, :zip_code, :password, :password_confirmation, :uid)
    end

    def find_user
      @owner = Owner.find(params[:id])
    end

end
