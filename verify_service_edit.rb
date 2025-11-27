# Verify Service Editing Logic

include Rails.application.routes.url_helpers

# 1. Setup Service with Tier
user = User.create!(
  email_address: 'test_owner_edit@example.com', 
  password: 'password', 
  password_confirmation: 'password',
  first_name: 'Edit',
  last_name: 'Tester'
)
company = Company.create!(company_name: 'Edit Corp', city: 'City', country: 'Country', user: user)
service = company.services.create!(name: 'Original Service', description: 'Original Desc')
tier = service.service_tiers.create!(service_plan: 'Original Tier', price: 10.0)

puts "Original: #{service.name}, #{tier.service_plan}, #{tier.price}"

# 2. Simulate Update
service.update!(
  name: 'Updated Service',
  service_tiers_attributes: [
    { id: tier.id, service_plan: 'Updated Tier', price: 20.0 }
  ]
)

tier.reload
puts "Updated: #{service.name}, #{tier.service_plan}, #{tier.price}"

if service.name == 'Updated Service' && tier.service_plan == 'Updated Tier' && tier.price == 20.0
  puts "SUCCESS"
else
  puts "FAILURE"
end
