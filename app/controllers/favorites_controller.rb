class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @company = Company.find(params[:company_id])
    @favorite.company = @company
    @favorite.user = current_user
    if @favorite.save
      redirect_to request.referer + "#company-#{@company.id}"
    end
    authorize @favorite
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.stop_loss = params[:favorite][:stop_loss].to_i
    @favorite.save
    redirect_to request.referer
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
