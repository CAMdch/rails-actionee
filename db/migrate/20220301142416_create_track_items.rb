class CreateTrackItems < ActiveRecord::Migration[6.1]
  def change
    create_table :track_items do |t|
      t.integer :stock_quantity
      t.float :stop_loss
      t.float :value_stock
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
