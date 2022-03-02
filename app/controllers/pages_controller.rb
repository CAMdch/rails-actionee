class PagesController < ApplicationController
  def home
    @top_3_companies = Company.all
    @favorite = Favorite.new
    @favorite_user = Favorite.where('user_id = ?', current_user)
  end
end
