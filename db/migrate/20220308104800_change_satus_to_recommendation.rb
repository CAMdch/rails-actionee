class ChangeSatusToRecommendation < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :status, :sting
  end
end
