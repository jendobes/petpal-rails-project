class ApplicationController < ActionController::Base
  # before_action :verify_user_is_authenticated
  helper_method :current_user

  private
  def verify_user_is_authenticated
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    Owner.find_by(id:session[:user_id])
  end
end
