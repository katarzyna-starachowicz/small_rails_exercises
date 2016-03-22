class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User created"
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:notice] = "User was not created"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
