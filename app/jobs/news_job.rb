require 'finnhub_ruby'
require 'time'

class NewsJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    @company = Company.find_by('symbol = ?', ticker)
    finnhub_client = FinnhubRuby::DefaultApi.new
    now = Date.today
    one_year_ago = (now - 360)
    news1 = finnhub_client.company_news(ticker, one_year_ago, now)[0]
    news2 = finnhub_client.company_news(ticker, one_year_ago, now)[1]
    news3 = finnhub_client.company_news(ticker, one_year_ago, now)[2]

    Publication.create!(title: news1.headline, author: news1.source, content: news1.summary, link: news1.url, company_id: @company.id)
    Publication.create!(title: news2.headline, author: news2.source, content: news2.summary, link: news2.url, company_id: @company.id)
    Publication.create!(title: news3.headline, author: news3.source, content: news3.summary, link: news3.url, company_id: @company.id)
  end
end
