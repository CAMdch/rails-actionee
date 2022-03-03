class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).all
    @favorite_user = Favorite.where('user_id = ?', current_user)
    authorize @companies
  end

  def show
    @company = Company.find(params[:id])
    @favorite_user = Favorite.where('user_id = ?', current_user)
    @review = Review.new
    @reviews = Review.where('company_id = ?', @company.id)
    authorize @company
    @marker = [{ lat: @company.latitude, lng: @company.longitude }]
  end
end
