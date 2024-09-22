class EateriesController < ApplicationController
  def index
    #@eateries = Eatery.where(approved: true)
    #@star_average = @eatery.reviews.average(:star).to_f
  end

  def new
    @eatery = Eatery.new
  end

  def create
    @eatery = Eatery.new(eatery_params)
    @eatery.user_id = current_user.id
    #@eatery.category_id = params[:category_id]
    @eatery.save
    redirect_to user_path(current_user)
  end

  def show
    @user = current_user
    @new_review = Review.new
    #@review = Review.find(params[:id])
    @eatery = Eatery.find(params[:id])
    @categories = @eatery.categories
  end

  private

  def eatery_params
    params.require(:eatery).permit(:restaurant_name, :address, :phone_number, :home_page, category_ids: [])
  end

end
