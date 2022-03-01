class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.float :value
      t.date :date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
