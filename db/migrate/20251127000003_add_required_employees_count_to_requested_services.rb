class AddRequiredEmployeesCountToRequestedServices < ActiveRecord::Migration[8.0]
  def change
    add_column :requested_services, :required_employees_count, :integer, default: 1
  end
end
