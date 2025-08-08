class CreateRequestedServices < ActiveRecord::Migration[8.0]
  def change
    create_table :requested_services do |t|
      t.datetime :requested_at, null: false
      t.string :status, null: false, default: 'pending'
      t.boolean :is_completed, default: false

      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true


      t.timestamps
    end
  end
end
