class RenameHeadquaterToCompany < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :headquater_city, :headquarter_city
  end
end
