class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
