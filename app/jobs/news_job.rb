require 'finnhub_ruby'
require 'time'

class NewsJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    now = Date.today
    one_year_ago = (now - 360)
    news1 = finnhub_client.company_news(ticker, one_year_ago, now)[0]
    news2 = finnhub_client.company_news(ticker, one_year_ago, now)[1]
    news3 = finnhub_client.company_news(ticker, one_year_ago, now)[2]
    return [news1, news2, news3]
  end
end
