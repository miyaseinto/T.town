class UsersController < ApplicationController
  before_action :set_user, except: :update

  def show
    user = User.find(params[:id])
    @name = user.name
    @tweets = user.tweets
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to "/users/#{current_user.id}"
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :profile_image)
  end
end
