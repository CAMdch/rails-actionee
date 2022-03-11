class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @company = Company.find(params[:company_id])
    @favorite.company = @company
    @favorite.user = current_user
    if @favorite.save
      if request.referer == "http://localhost:3000/companies/#{@company.id}" || request.referer == "https://actionee.herokuapp.com/companies/#{@company.id}" || request.referer == "http://www.actionee.net/companies/#{@company.id}" || request.referer == "https://www.actionee.net/companies/#{@company.id}"
        redirect_to profile_path + "#company-#{@company.id}"
      else
        redirect_to request.referer + "#company-#{@company.id}"
      end
    end
    authorize @favorite
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.stop_loss = params[:favorite][:stop_loss].to_i
    @favorite.save
    @company = Company.find(params[:favorite][:company_id])
    redirect_to request.referer + "#company-#{@company.id}"
    authorize @favorite
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @company = @favorite.company
    if TrackItem.tracked?(@favorite)
      TrackItem.track(@favorite).map { |item| item.destroy }
    end
    @favorite.destroy
    redirect_to request.referer + "#company-#{@company.id}"
    authorize @favorite
  end
end
