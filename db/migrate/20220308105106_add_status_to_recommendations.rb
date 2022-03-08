class AddStatusToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :status, :string
  end
end
