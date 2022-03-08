class AddAlertDismissedToTrackItems < ActiveRecord::Migration[6.1]
  def change
    add_column :track_items, :alert_dismissed, :boolean, default: false
  end
end
