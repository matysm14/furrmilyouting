class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.eatery_id = params[:review][:eatery_id]
    @review.save
    redirect_to eateries_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update (review_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to _path(@review.id)
    else
    render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    rediret_to user_path(@user.id)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :image, :body, :eatery_id, :star)
  end

end
