class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  def require_is_admin
     unless current_user.try(:admin?)
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end
end
