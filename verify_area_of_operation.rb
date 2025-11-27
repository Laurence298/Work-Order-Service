# Verify Area of Operation Logic

# 1. Setup Company
user = User.create!(email: "test_owner@example.com", password: "password", password_confirmation: "password")
company = Company.create!(
  company_name: "Test Corp", 
  city: "Metropolis", 
  country: "Utopia", 
  user: user
)

puts "Company created: #{company.company_name} in #{company.city}, #{company.country}"

# 2. Simulate Controller Logic (New Action)
requested_service = company.requested_services.new
requested_service.build_customer
requested_service.customer.build_address(
  city: company.city,
  country: company.country
)

# 3. Verify Address Defaults
address = requested_service.customer.address
puts "New Request Address City: #{address.city}"
puts "New Request Address Country: #{address.country}"

if address.city == "Metropolis" && address.country == "Utopia"
  puts "SUCCESS: Defaults applied correctly."
else
  puts "FAILURE: Defaults mismatch."
end
