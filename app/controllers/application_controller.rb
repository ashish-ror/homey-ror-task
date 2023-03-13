class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :set_current_user, if: :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_current_user
    Current.user = current_user
  end
end
