class PagesController < ApplicationController
  def home
    @companies = Company.joins(:stocks).order(value: :ASC, created_at: :DESC).uniq
    @top_3_companies = [@companies[0], @companies[1], @companies[2]]
    @favorite = Favorite.new
    @favorite_user = Favorite.where('user_id = ?', current_user)
  end
end
