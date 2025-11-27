class CreateServiceAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :service_assignments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :requested_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
