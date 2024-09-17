class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.eatery_id = params[:review][:eatery_id]
    @review.save
    redirect_to eatery_path(@review.eatery_id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update (review_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :eatery_id, :star, images: [])
  end

end
