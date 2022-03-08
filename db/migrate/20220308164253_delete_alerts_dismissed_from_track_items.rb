class DeleteAlertsDismissedFromTrackItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :track_items, :alert_dismissed, :boolean
  end
end
