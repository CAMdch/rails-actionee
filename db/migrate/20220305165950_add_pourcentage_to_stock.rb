class AddPourcentageToStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :pourcentage, :float
  end
end
