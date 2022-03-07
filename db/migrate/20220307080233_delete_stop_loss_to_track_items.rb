class DeleteStopLossToTrackItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :track_items, :stop_loss
  end
end
