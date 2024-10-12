class LodgingReviewsController < ApplicationController

  def create
    @lodging_review = LodgingReview.new(lodging_review_params)
    @lodging_review.user_id = current_user.id
    @lodging_review.lodging_id = params[:lodging_review][:lodging_id]
    @lodging_review.save
    redirect_to lodging_path(@lodging_review.lodging_id)
  end

  def edit
    @lodging_review = LodgingReview.find(params[:id])
  end

  def update
    @lodging_review = LodgingReview.find(params[:id])
    if @lodging_review.update (lodging_review_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  def destroy
    lodging_review = LodgingReview.find(params[:id])
    lodging_review.destroy
    redirect_to user_path(current_user)
  end

  private

  def lodging_review_params
    params.require(:lodging_review).permit(:title, :body, :lodging_id, :star, images: [])
  end

end
