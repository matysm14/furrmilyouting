class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    #@review = Review.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "アカウント情報を変更しました。"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


  #def destroy
    #@user = User.find(params[:id])
    #@user.destroy
    #flash[:notice] = 'アカウント情報を削除しました。'
    #redirect_to :root
  #end

  def favorites
    @user = User.find(params[:id])
    favorites_eatery = Favorite.where(user_id: @user.id).pluck(:eatery_id)
    favorites_lodging = LodgingFavorite.where(user_id: @user.id).pluck(:lodging_id)
    @favorite_eateries = Eatery.find(favorites_eatery)
    @favorite_lodging = Lodging.find(favorites_lodging)
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
