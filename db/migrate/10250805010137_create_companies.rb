class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false

      t.timestamps


      t.references :user, null: false, foreign_key: true
    end
  end
end
