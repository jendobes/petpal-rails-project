class RescuesController < ApplicationController
  before_action :verify_user_is_authenticated, only: [:new,:edit]
  before_action :find_pet, :find_rescue, :find_owner

  def index
    @owners = Owner.hero
    if params[:owner_id]
      @rescues = Owner.find(params[:owner_id]).rescues
    else
      @rescues = Rescue.all
    end
  end

  def show

  end

  def new
    @rescue = Rescue.new
  end

  def create
    @rescue = @owner.rescues.build(rescue_params)
    if @rescue.save
      redirect_to owner_rescues_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @rescue.update(rescue_params)
    if @rescue.save
      redirect_to owner_rescue_path(@rescue)
    else
      render 'edit'
    end
  end

  def destroy
    @rescue.destroy
    redirect_to owner_rescues_path
  end

  private

    def rescue_params
      params.require(:rescue).permit(:owner_id, :pet_id, :story)
    end

    def find_owner
      if params[:owner_id]
        @owner = Owner.find(params[:owner_id])
      else
        @owner = current_user
      end
    end

    def find_pet
      if params[:pet_id]
        @pet = Pet.find(params[:pet_id])
      end
    end

    def find_rescue
      if params[:id]
        @rescue = Rescue.find(params[:id])
      end
    end

end
