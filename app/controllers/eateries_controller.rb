class EateriesController < ApplicationController
  def index
    @eatery = Eatery.where(approved: true)
  end

  def new
    @eatery = Eatery.new
  end

  def create
    @eatery = Eatery.new(eatery_params)
    @eatery.user_id = current_user.id
    @eatery.save
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @new_review = Review.new
    @review = Review.find(params[:id])
    @eatery = Eatery.find(params[:id])
  end

  private

  def eatery_params
    params.require(:eatery).permit(:restaurant_name, :address, :phone_number, :home_page)
  end

end
