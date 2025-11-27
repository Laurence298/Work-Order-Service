# Verify Province/State Logic

# 1. Setup Company with Province
user = User.create!(
  email_address: 'test_owner_province@example.com', 
  password: 'password', 
  password_confirmation: 'password',
  first_name: 'Province',
  last_name: 'Tester'
)
company = Company.create!(
  company_name: 'Province Corp', 
  city: 'City', 
  province: 'MyProvince', 
  country: 'Country', 
  user: user
)

puts "Company: #{company.company_name}, #{company.province}"

# 2. Simulate Controller Logic
rs = company.requested_services.new
rs.build_customer
rs.customer.build_address(
  city: company.city,
  province: company.province,
  country: company.country
)

addr = rs.customer.address
puts "New Request Address: #{addr.city}, #{addr.province}, #{addr.country}"

if addr.province == 'MyProvince'
  puts "SUCCESS"
else
  puts "FAILURE"
end
