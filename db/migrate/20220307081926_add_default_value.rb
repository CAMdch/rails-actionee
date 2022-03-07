class AddDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :favorites, :stop_loss, :integer, :default => 0
  end
end
