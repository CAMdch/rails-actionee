class AddDismissedToAlerts < ActiveRecord::Migration[6.1]
  def change
    add_column :alerts, :dismissed, :boolean
  end
end
