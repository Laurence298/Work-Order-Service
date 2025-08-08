class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false

      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
