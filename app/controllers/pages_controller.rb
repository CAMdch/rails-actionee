class PagesController < ApplicationController
  def home
    @top_3_companies = Company.all
  end
end
