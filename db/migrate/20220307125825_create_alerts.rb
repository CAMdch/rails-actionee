class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.references :track_items, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
