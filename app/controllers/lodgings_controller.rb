class LodgingsController < ApplicationController
  def new
    @lodging = Lodging.new
  end

  def create
    @lodging = Lodging.new(lodging_params)
    @lodging.user_id = current_user.id
    @lodging.save
    redirect_to user_path(current_user)
  end

  def show
    @user = current_user
    @lodging_review = Review.new
    #@review = Review.find(params[:id])
    @lodging = Lodging.find(params[:id])
    @categories = @lodging.l_categories
  end

  private

  def lodging_params
    params.require(:lodging).permit(:lodging_name, :address, :phone_number, :home_page, l_category_ids: [])
  end

end
