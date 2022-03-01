class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.string :status
      t.date :month
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
