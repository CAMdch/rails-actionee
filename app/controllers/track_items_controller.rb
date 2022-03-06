class TrackItemsController < ApplicationController
  def create
    @track_items = TrackItem.new(track_items_params)
    @track_items.user = current_user
    authorize @track_items
    unless params["sell"].nil?
      negative_stock_quantity = @track_items.stock_quantity
      @track_items.stock_quantity = - negative_stock_quantity
    end
    @track_items.save
    unless @track_items.save
      flash[:notice] = 'It has been saved'
    end
    redirect_to profile_path
  end

  private

  def track_items_params
    params.require(:track_item).permit(:stop_loss, :stock_quantity, :value_stock, :company_id)
  end
end
