class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers   do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.date :date_of_birth

      t.timestamps
    end
  end
end
