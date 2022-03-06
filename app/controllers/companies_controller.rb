require "json"
require "open-uri"
require 'finnhub_ruby'

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
    recommendation(@company.symbol)
    @news = Publication.where('company_id = ?', @company.id).order('created_at DESC').limit(3)
    @currency = Stock.where('company_id = ?', @company.id).order('created_at DESC').first
    authorize @company
    @marker = [{ lat: @company.latitude, lng: @company.longitude }]
  end

  private

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
