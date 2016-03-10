class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:notice] = "You're in!"
      render :new
    else
      flash.now[:alert] = "Invalid email/password."
      render :new
    end
  end

  def delete
  end

  def destroy
    sign_out if logged_in?
    flash.now[:notice] = "You're out!"
    render :new
  end
end
