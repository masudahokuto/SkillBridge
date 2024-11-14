class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :likes]
  before_action :redirect_if_not_current_user, only: [:edit, :update, :likes]

  def index
  end

  def show
  end

  def edit
    @user.qualifications.build if @user.qualifications.empty?
    @skill_tags = SkillTag.all
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
    @skill_tags = @user.skill_tags
  end

  def destroy_qualification
    @user = current_user
    @qualification = @user.qualifications.find(params[:qualification_id])

    if @qualification.destroy
      flash[:notice] = "資格情報が削除されました"
    else
      flash[:alert] = "削除に失敗しました"
    end

    # 削除後に元のページにリダイレクト
    redirect_back(fallback_location: mypage_users_path(@user))
  end

  def likes
    @portfolios = @user.favorite_portfolios
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def redirect_if_not_current_user
    redirect_to portfolios_path unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:nick_name, :profile, :gender, :location, :birthday, :email, :password, :work_experience, :profile_image, skill_tag_ids: [])
  end

end
