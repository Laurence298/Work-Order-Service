class AddServiceTierToRequestedServices < ActiveRecord::Migration[8.0]
  def change
    add_reference :requested_services, :service_tier, null: true, foreign_key: { to_table: :service_details }
  end
end
