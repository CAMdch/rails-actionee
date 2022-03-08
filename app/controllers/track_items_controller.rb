class TrackItemsController < ApplicationController
  def create
    @track_items = TrackItem.new(track_items_params)
    @company = Company.find(params[:track_item][:company_id])
    @track_items.user = current_user
    authorize @track_items
    unless params["sell"].nil?
      negative_stock_quantity = @track_items.stock_quantity
      @track_items.stock_quantity = - negative_stock_quantity
    end
    @track_items.save
    redirect_to profile_path + "#company-#{@company.id}"
  end

  def dismiss
    @track_item = TrackItem.find(params[:id])
    @track_item.alert_dismissed = true
    authorize @track_item
    @track_item.save!
    redirect_to profile_path + "#company-#{@track_item.company.id}"
  end

  def reset
    @track_item = TrackItem.find(params[:id])
    @track_item.alert_dismissed = false
    authorize @track_item
    @track_item.save!
    redirect_to profile_path + "#company-#{@track_item.company.id}"
  end

  private

  def track_items_params
    params.require(:track_item).permit(:stock_quantity, :value_stock, :company_id, :alert_dismissed)
  end

  # def start_alert(track_items)
  #   alert = Alert.new(track_items: track_items)
  #   alert.save
  # end
end
