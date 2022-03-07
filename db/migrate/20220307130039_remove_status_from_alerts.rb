class RemoveStatusFromAlerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :alerts, :status, :string
  end
end
