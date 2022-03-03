class LikesController < ApplicationController
  def create
    if params[:name] == "like"
      @like = Like.new(enjoyed: true)
    else
      @like = Like.new(enjoyed: false)
    end
    @like.user = current_user
    @review = Review.find(params[:review_id])
    @like.review = @review
    @like.save
    authorize @like
    redirect_to request.referer + "#review-#{@review.id}"
  end

  def update
    @like = Like.find_by('user_id = ? AND review_id = ?', current_user, params[:review_id])
    if params[:name] == "dislike"
      @like.enjoyed = false
    else
      @like.enjoyed = true
    end
    @like.save
    authorize @like
    @review = Review.find(params[:review_id])
    redirect_to request.referer + "#review-#{@review.id}"
  end
end
