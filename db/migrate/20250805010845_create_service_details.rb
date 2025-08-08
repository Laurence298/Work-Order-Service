class CreateServiceDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :service_details do |t|
      t.string :service_plan, null: false
      t.text :features, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.references :service, null: false, foreign_key: true
      t.timestamps
    end
  end
end
