require 'json'

# Read user and company JSON files
users = JSON.parse(File.read('users.json'))
companies = JSON.parse(File.read('companies.json'))

# Filter and sort users
eligible_users = users.select do |user|
  company = companies.find { |c| c['id'] == user['company_id'] }
  user['active_status'] && company && company['email_status']
end

eligible_users.sort_by! { |user| user['last_name'] }


companies.sort_by! { |company| company['id'] }


top_up_amounts = {}


# output logic starts here
File.open('output.txt', 'w') do |file|
  companies.each do |company|
    company_id = company['id']
    company_name = company['name']

    file.puts("Company Id: #{company_id}")
    file.puts("Company Name: #{company_name}")
    file.puts("Users Emailed:")

    emailed_users = eligible_users.select { |user| user['company_id'] == company_id }
    emailed_users.each do |user|
      last_name = user['last_name']
      first_name = user['first_name']
      email = user['email']
      previous_tokens = user['tokens']
      top_up = company['top_up']
      new_tokens = previous_tokens + top_up

      file.puts("\t#{last_name}, #{first_name}, #{email}")
      file.puts("\t  Previous Token Balance: #{previous_tokens}")
      file.puts("\t  New Token Balance: #{new_tokens}")
    end

    total_top_up = emailed_users.map { |user| company['top_up'] }.sum
    top_up_amounts[company_id] = total_top_up

    file.puts("Users Not Emailed:")

    not_emailed_users = users.select do |user|
      user['company_id'] == company_id &&
        (!user['active_status'] || !company['email_status'])
    end

    not_emailed_users.each do |user|
      last_name = user['last_name']
      first_name = user['first_name']
      email = user['email']

      file.puts("\t#{last_name}, #{first_name}, #{email}")
    end

    file.puts("Total amount of top ups for #{company_name}: #{total_top_up}")
    file.puts("\n")
  end
end

puts 'done!!! :)'
