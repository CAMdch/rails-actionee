class PagesController < ApplicationController
  def home
    @companies = Company.all
    companies_pourcentage = @companies.map do |company|
      stock = company.stocks.order('created_at DESC').first
      { company: company, stock: stock.pourcentage }
    end
    @companies_order = companies_pourcentage.sort_by { |h| h[:stock] }
    @companies_order.reverse!
    @top_3_companies = [@companies_order[0][:company], @companies_order[1][:company], @companies_order[2][:company]]
    @favorite = Favorite.new
    @favorite_user = Favorite.where('user_id = ?', current_user)
  end
end
