require 'finnhub_ruby'

class StockJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    api_response = finnhub_client.quote(ticker)
    currency_value = api_response.c
    pourcentage = ((api_response.d.fdiv(currency_value))*100).round(2)
    company = Company.find_by('symbol = ?', ticker)
    stock_last = Stock.where('company_id = ?', company.id).last
    Stock.create!(date: Time.now, value: currency_value.round, pourcentage: pourcentage, company_id: company.id) if stock_last.created_at + 600 < Time.now
  end
end
