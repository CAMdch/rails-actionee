class CompaniesController < ApplicationController
  def index
    if params[:query].present?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%")
    else
      @companies = policy_scope(Company).all
    end
    @favorite_user = Favorite.where('user_id = ?', current_user)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'companies_list', locals: { companies: @companies }, formats: [:html] }
    end

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
