class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:notice] = "You're in!"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email/password."
      render :new
    end
  end

  def delete
  end

  def destroy
    sign_out if logged_in?
    flash[:notice] = "You're out!"
    redirect_to root_path
  end
end
