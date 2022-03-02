class ProfilesController < ApplicationController
  def dashboard
    @profile = current_user
    authorize @profile
    @top_3_companies = Company.all
  end
end
