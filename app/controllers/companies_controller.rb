class CompaniesController < ApplicationController
  def index
    if params[:query].present?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%")
    else
      @companies = policy_scope(Company).all
    end
    # if filter_request?
    #   @companies = @companies.where('')
    # end
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

  def filter_request?
    array = []
    Tag.all.each do |tag|
      array << !params[tag.name.to_s.to_sym].nil?
    end
    array.any? { |value| value == true }
  end

  def filter_params
    filter_hash = {}
    params.each do |key, value|
      filter_hash[key] = value if value == "on"
    end
    filter_hash
  end

  def filter_params_size
    filter_params.length
  end

  def sql_query_for_filters
    sql_query = " \
        companies.tags ILIKE :query \
        OR movies.synopsis ILIKE :query \
        OR directors.first_name ILIKE :query \
        OR directors.last_name ILIKE :query \
      "
  end
end
