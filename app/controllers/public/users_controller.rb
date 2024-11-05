class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :redirect_if_not_current_user, only: [:edit, :update]

  def index
  end

  def show
  end

  def edit
    @user = current_user
    @user.qualifications.build if @user.qualifications.empty?
  end

  def update
    if params[:user][:qualifications_input].present?
      qualifications = params[:user][:qualifications_input].split(',').map(&:strip)

      qualifications.each do |qualification_name|
        unless qualification_name.empty?
          # 同じ資格名がすでに存在しないか確認
          unless @user.qualifications.exists?(name: qualification_name)
            @user.qualifications.create(name: qualification_name)
          end
        end
      end
    end

    if @user.update(user_params)
      redirect_to mypage_users_path, notice: 'プロフィールが更新されました'
    else
      render :edit
    end
  end

  def mypage
    @user = current_user
    @portfolios = @user.portfolios
    @qualifications = @user.qualifications
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def redirect_if_not_current_user
    redirect_to posts_path unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:nick_name, :profile, :gender, :location, :birthday, :email, :password, :work_experience, :profile_image)
  end

end
