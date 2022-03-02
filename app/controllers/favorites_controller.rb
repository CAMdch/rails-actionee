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

  def destroy
    @favorite = Favorite.find(params[:id])
    @company = @favorite.company
    @favorite.destroy
    redirect_to request.referer + "#company-#{@company.id}"
    authorize @favorite
  end
end
