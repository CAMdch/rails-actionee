class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :web_site_url
      t.string :headquater_city
      t.string :photo_url
      t.string :symbol

      t.timestamps
    end
  end
end
