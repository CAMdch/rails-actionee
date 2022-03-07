class AddStopLossToFavorite < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :stop_loss, :integer
  end
end
