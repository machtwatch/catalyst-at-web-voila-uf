When("[Desktop] user fill email {string} on login page") do |cre|
  @page.login_page.input_email_or_phone(cre)
end

When("[Desktop] user fill password {string} on login page") do |password|
  @page.login_page.input_password(password)
end

When("[Desktop] user click sign in button on login page") do ||
  @page.login_page.click_sign_in
end

When("[Desktop] user see voila loader disappear") do ||
  @page.login_page.voila_loader
end

When("-") do ||

end