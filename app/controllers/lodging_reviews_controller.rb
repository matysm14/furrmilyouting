class LodgingReviewsController < ApplicationController
  def create
    @review = Review.new(lodging_review_params)
    @review.user_id = current_user.id
    @review.lodging_id = params[:lodging_review][:lodging_id]
    @review.save
    redirect_to lodging_path(@review.lodging_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def lodging_review_params
    params.require(:lodging_review).permit(:title, :body, :lodging_id, :star, images: [])
  end
  
end
