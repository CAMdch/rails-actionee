require 'finnhub_ruby'

class StockJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    currency_value = finnhub_client.quote(ticker).c
    pourcentage = ((finnhub_client.quote(ticker).d.fdiv(currency_value))*100).round(2)
    company = Company.find_by('symbol = ?', ticker)
    Stock.create!(date: Time.now, value: currency_value.round, pourcentage: pourcentage, company_id: company.id)
  end
end
