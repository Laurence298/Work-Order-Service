# Verify Service Tier Logic

# 1. Setup
user = User.create!(
  email_address: 'test_owner_tier@example.com', 
  password: 'password', 
  password_confirmation: 'password',
  first_name: 'Tier',
  last_name: 'Tester'
)
company = Company.create!(
  company_name: 'Tier Corp', 
  city: 'City', 
  province: 'Province', 
  country: 'Country', 
  user: user
)
service = company.services.create!(name: 'Tier Service', description: 'Desc')
tier = service.service_tiers.create!(service_plan: 'Gold Plan', price: 99.0, description: 'Gold Desc')

puts "Tier ID: #{tier.id}"

# 2. Simulate Controller Create
rs = company.requested_services.new(
  service_id: service.id,
  service_tier_id: tier.id,
  required_employees_count: 1
)
rs.build_customer(first_name: 'Cust', last_name: 'Omer', email: 'c@example.com', phone_number: '123')
rs.customer.build_address(street: 'St', city: 'C', province: 'P', postal_code: 'Z', country: 'Co')

rs.save!

puts "Requested Service Tier ID: #{rs.service_tier_id}"
puts "Plan Name: #{rs.plan_name}"
puts "Price: #{rs.price}"

if rs.service_tier_id == tier.id && rs.plan_name == 'Gold Plan' && rs.price == 99.0
  puts "SUCCESS"
else
  puts "FAILURE"
end
