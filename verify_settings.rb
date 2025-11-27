# Verify Company Settings Logic

include Rails.application.routes.url_helpers

# 1. Verify Route Helper
puts "Edit Path: #{edit_companies_path}"

# 2. Verify Model Update
user = User.create!(
  email_address: 'test_owner_settings@example.com', 
  password: 'password', 
  password_confirmation: 'password',
  first_name: 'Settings',
  last_name: 'Tester'
)
company = Company.create!(company_name: 'Old Name', city: 'Old City', country: 'Old Country', user: user)

puts "Original: #{company.company_name}, #{company.city}, #{company.country}"

company.update!(company_name: 'New Name', city: 'New City', country: 'New Country')

puts "Updated: #{company.company_name}, #{company.city}, #{company.country}"

if company.company_name == 'New Name' && company.city == 'New City'
  puts "SUCCESS"
else
  puts "FAILURE"
end
