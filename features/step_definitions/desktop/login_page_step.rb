When("[Desktop] user fill email or phone {string} on login page") do |email_or_phone|
  @page.login_page.input_email_or_phone(email_or_phone)
end

When("[Desktop] user fill password {string} on login page") do |password|
  @page.login_page.input_password(password)
end

When("[Desktop] user click sign in button on login page") do ||
  @page.login_page.click_sign_in_button
end

When("[Desktop] user see voila loader disappear") do ||
  @page.login_page.voila_loader
end

When("[Desktop] user sign in with email using account {string}") do |data|
  config_data = get_config_data('account')[data]
  @page.login_page.input_email_or_phone(config_data['username'])
  @page.login_page.input_password(config_data['password'])
  @page.login_page.click_sign_in_button
end

Then("[Desktop] user see all component on login page") do
  wait_for_ajax
  @page.login_page.all_component_on_login_page
end

When("[Desktop] user print otp") do
  otp = fetch_otp
  puts "The OTP is: #{otp}"
  raise "Failed to fetch OTP from email" if otp.nil?
end

When("[Desktop] user print text") do
  channel_name = '#voila-integration-dev'
  text_to_find = 'You can click the button below or download the attachment HTML file to see more detail'
  @found_message = find_message(channel_name, text_to_find)
end
