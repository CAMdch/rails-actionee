class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).all
    @favorite_user = Favorite.where('user_id = ?', current_user)
    authorize @companies
  end
end
