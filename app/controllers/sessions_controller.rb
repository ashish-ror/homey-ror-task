class SessionsController < ApplicationController
  def new
    redirect_to projects_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: 'Signed in successfully'
    else
      redirect_to root_url, notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out successfully'
  end
end
