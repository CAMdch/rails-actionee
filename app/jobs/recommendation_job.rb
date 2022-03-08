require 'finnhub_ruby'

class RecommendationJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    company_month = finnhub_client.recommendation_trends(ticker).first
    company = Company.find_by('symbol = ?', ticker)
    buy = company_month.buy
    hold = company_month.hold
    sell = company_month.sell
    total = buy + hold + sell
    buy_value = buy.fdiv(total) * 100
    hold_value = hold.fdiv(total) * 100
    sell_value = 100 - buy_value.round - hold_value.round
    puts Recommendation.create!(buy: buy_value.round, hold: hold_value.round, sell: sell_value, month: company_month.period, company_id: company.id)
  end
end
