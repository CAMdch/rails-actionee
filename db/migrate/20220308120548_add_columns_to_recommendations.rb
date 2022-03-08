class AddColumnsToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :buy, :integer
    add_column :recommendations, :sell, :integer
    add_column :recommendations, :hold, :integer
  end
end
