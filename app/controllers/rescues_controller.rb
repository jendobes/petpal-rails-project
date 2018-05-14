class RescuesController < ApplicationController
  before_action :verify_user_is_authenticated, only: [:new,:edit]

  def index
    if params[:owner_id]
      @rescues = Owner.find(params[:owner_id]).rescues
    elsif params[:pet_id]
      @rescues = Pet.find(params[:pet_id]).rescues
    else
      @rescues = Rescue.all
    end
  end

  def show
    @rescue = Rescue.find(params[:id])
  end

  def new
    @rescue = Rescue.new
    @pet = Pet.find(params[:pet_id])
    @owner = Owner.find(current_user.id)
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @rescue = @owner.rescues.build(rescue_params)
    if @rescue.save
      redirect_to owner_rescues_path
    else
      render 'new'
    end
  end

  def edit
    @owner = Owner.find(params[:owner_id])
    @rescue = Rescue.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:owner_id])
    @rescue = Rescue.find(params[:id])
    @rescue.update(rescue_params)
    if @rescue.save
      redirect_to owner_rescue_path(@rescue)
    else
      render 'edit'
    end
  end

  def destroy
    @rescue = Rescue.find(params[:id])
    @rescue.destroy
    redirect_to owner_rescues_path
  end

  private

  def rescue_params
    params.require(:rescue).permit(:owner_id, :pet_id, :story)
  end

end
