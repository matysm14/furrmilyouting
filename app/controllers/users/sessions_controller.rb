class Users::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to search_path, notice: "guestuserでログインしました。"
  end

  def reject_inactive_user
    return if params[:admin]

    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end
end