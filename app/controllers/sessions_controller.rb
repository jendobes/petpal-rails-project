class SessionsController < ApplicationController

  def new
    @user = Owner.new
  end

  def create
    if request.env["omniauth.auth"]
      @user = Owner.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to owner_path(@user)
    else
      @user = Owner.find_by(:email => params[:email])
      if params[:password] == ""
        redirect_to '/signin'
      else
        return redirect_to root_path unless @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to owner_path(@user)
      end
    end
  end


  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end
