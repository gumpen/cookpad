class UsersController < ApplicationController
  before_action :set_user
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def follow
    current_user.follow(@user)
  end

  def unfollow
    current_user.stop_following(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
