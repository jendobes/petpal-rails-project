class ApplicationController < ActionController::Base
  helper_method :current_user


  private

    def verify_user_is_authenticated
      if !user_is_authenticated
        redirect_to '/'
        flash[:fail] = "You must be logged-in to access this page."
      end
    end

    def user_is_authenticated
      !!current_user
    end

    def current_user
      Owner.find_by(id:session[:user_id])
    end

end
