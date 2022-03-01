class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :link
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
