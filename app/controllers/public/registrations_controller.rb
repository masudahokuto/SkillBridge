class Public::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    mypage_users_path
  end

  # サインアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    mypage_users_path
  end

  # 更新後のリダイレクト先
  def after_update_path_for(resource)
    mypage_users_path
  end

  def create

    logger.debug "Resource saved: #{resource.inspect}"

    build_resource(sign_up_params)

    if resource.save

      logger.debug "Before saving resource: #{resource.inspect}"

      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      logger.debug "Resource not saved: #{resource.errors.full_messages}"
      # エラーメッセージをセッションに保存
      session[:error_messages] = resource.errors.full_messages
      puts "DEBUG: Error messages saved to session: #{session[:error_messages]}" # 追加して確認
      redirect_to new_user_registration_path  # new アクションにリダイレクト
    end
  end

  protected

  # サインアップ時に許可するパラメータの設定
  def sign_up_params
    params.require(:user).permit(:nick_name, :profile, :gender, :birthday, :email, :password, :password_confirmation, :location, :profile_image)
  end

  def redirect_if_admin_signed_in
    if admin_signed_in?
      redirect_to admin_users_path, alert: "アドミンとしてログインしています。"
    end
  end
end
