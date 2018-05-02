class RescuesController < ApplicationController

  def index
    if params[:owner_id]
      @rescues = Owner.find(params[:owner_id]).rescues
    else
      @rescues = Rescue.all
    end
  end

  def show
    @rescue = Rescue.find(params[:id])
  end

  def new
    @rescue = Rescue.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def rescue_params
    params.require(:rescue).permit(:owner_id, :pet_id, :story)
  end

end
