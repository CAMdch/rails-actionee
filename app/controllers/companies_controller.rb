require "json"
require "open-uri"
require 'finnhub_ruby'

class CompaniesController < ApplicationController
  def index
    if params[:query].present? && filter_request?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%").filter_tag(filter_params)
    elsif filter_request?
      @companies = policy_scope(Company).filter_tag(filter_params)
    elsif params[:query].present?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%")
      authorize @companies
    else
      @companies = policy_scope(Company).all
      authorize @companies
    end
    @favorite_user = Favorite.where('user_id = ?', current_user)
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'companies_list', locals: { companies: @companies }, formats: [:html] }
    end
  end


  def show
    @company = Company.find(params[:id])
    @favorite_user = Favorite.where('user_id = ?', current_user)
    @review = Review.new
    @reviews = Review.where('company_id = ?', @company.id)
    recommendation(@company.symbol)
    @news = Publication.where('company_id = ?', @company.id).order('created_at DESC').limit(3)
    @currency = Stock.where('company_id = ?', @company.id).order('created_at DESC').first
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

  def recommendation(ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    company_month = finnhub_client.recommendation_trends("#{ticker}")[0]

    if company_month.buy > company_month.hold && company_month.buy > company_month.sell
      return @recommendation = "Buy"
    elsif company_month.sell > company_month.hold && company_month.sell > company_month.buy
      return @recommendation = "Sell"
    else
      return @recommendation = "Hold"
    end
  end
end
# Tag.find_by(name: tag.name ) => tag intance
# tag int.id
# #Company.where(tag_id:  )

# company.tags
# make it into array and then randomise it
