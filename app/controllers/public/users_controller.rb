class Public::UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def mypage
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :profile, :gender, :location, :birthday, :email, :password,  :profile_image)
  end

end
