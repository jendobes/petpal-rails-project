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
    @owner = Owner.find(params[:owner_id])
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



{"utf8"=>"✓",
  "authenticity_token"=>"wmw3LLqctcUT5n08Nj25z/6yQNQt2yATOw2AHOqwA0l/7m1gFQL4PcDef6LDJmkX+k35P+LsMG4zoyRkLVyHMg==",
  "rescue"=>{
    "pet_id"=>"1", "story"=>"my story"
      },
    "commit"=>"Create Rescue",
    "controller"=>"rescues",
    "action"=>"create",
    "owner_id"=>"2"
  }
