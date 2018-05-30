class SessionsController < ApplicationController
  # skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
    @user = Owner.new
  end

  def create
    if request.env["omniauth.auth"]
      @user = Owner.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
     # u.image = auth['info']['image']
     # avatar_url = process_uri(auth.info.image)
     # u.update_attribute(:image, URI.parse(avatar_url))
     # u.image = URI.parse(avatar_url)
     # u.image = URI.parse(auth.info.image)
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

  # def process_uri(uri)
  #   require 'open-uri'
  #   require 'open_uri_redirections'
  #   open(uri, :allow_redirections => :safe) do |r|
  #     r.base_uri.to_s
  #   end
  # end

end
