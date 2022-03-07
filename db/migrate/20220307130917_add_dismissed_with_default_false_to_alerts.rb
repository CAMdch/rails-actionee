class AddDismissedWithDefaultFalseToAlerts < ActiveRecord::Migration[6.1]
  def change
    add_column :alerts, :dismissed, :boolean, default: false
  end
end
