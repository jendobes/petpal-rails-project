class SessionController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
    @user = Owner.new
  end

  def create
    if @user = Owner.find_by(email:params[:email])
      session[:user_id] = @user.id
      redirect_to owner_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end
