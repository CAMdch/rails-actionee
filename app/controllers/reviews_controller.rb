class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @company = Company.find(params[:company_id])
    @review.company = @company
    @review.user = current_user
    if @review.save
      redirect_to request.referer + "#review-#{@review.id}"
    end
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
