class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
                                  :name,
                                  :password,
                                  :happiness,
                                  :nausea,
                                  :tickets,
                                  :height,
                                  :admin
                                )
  end
end
