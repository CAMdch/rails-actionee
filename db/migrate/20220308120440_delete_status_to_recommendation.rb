class DeleteStatusToRecommendation < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :status, :string
  end
end
