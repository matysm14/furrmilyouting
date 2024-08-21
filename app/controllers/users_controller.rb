class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @review = Review.find(params[:id])
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

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
