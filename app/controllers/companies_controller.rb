class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company).all
    authorize @companies
  end
end
