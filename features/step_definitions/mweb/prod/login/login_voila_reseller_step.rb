Given("[Mweb][Prod] user access login page voila reseller platform") do
  @page.voila_homepage.load
  @page.voila_homepage.validateOnPage
end

Given("[Mweb][Prod] user enters username with {string} on the login page") do |username|
  @page.voila_homepage.inputUsername get_config_data(username)
end

Given("[Mweb][Prod] user enters password with {string} on the login page") do |password|
  @page.voila_homepage.inputPassword get_config_data(password)
end

When("[Mweb][Prod] user clicks button Masuk on the login page") do
  @page.voila_homepage.clickBtnMasuk
end

Then("[Mweb][Prod] user success login") do
  wait_in_sec get_config_data('ASSERT_URL_WAIT_TIME')
  expect(URI.parse(current_url)).to have_content("/catalog")
end

Then("[Mweb][Prod] user see error message invalid credentials") do
  @page.voila_homepage.showMsgInvalidUsernamePassword
end

Then('[Mweb][Prod] user can see button Masuk is disabled') do
  @page.voila_homepage.btnMasukIsDisabled
end

When("[Mweb][Prod] user clicks button chat via telegram on the login page") do
  @page.voila_homepage.clicksBtnChatViaTelegram
end

Then('[Mweb][Prod] user redirected to telegram page {string}') do |listAdmin|
  case listAdmin
  when "Admin Sales"
    wait_in_sec get_config_data('ASSERT_URL_WAIT_TIME')
    switch_to_window_title get_config_data('TELEGRAM_PAGE_TITLE_ADMIN_SALES')
    expect(URI.parse(current_url)).to have_content("t.me/adm_sales")
  when "Admin Gudang"
    wait_in_sec get_config_data('ASSERT_URL_WAIT_TIME')
    switch_to_window_title get_config_data('TELEGRAM_PAGE_TITLE_ADMIN_WAREHOUSE')
    expect(URI.parse(current_url)).to have_content("t.me/Aadminmb1")
  end
end

Given('[Mweb][Prod] user {string} checkbox remember me') do |status|
  if status == 'check'
    if !@page.voila_homepage.ckbRememberMeIsChecked
      @page.voila_homepage.checkRememberMe
    end
  elsif status == 'uncheck'
    if @page.voila_homepage.ckbRememberMeIsChecked
      @page.voila_homepage.uncheckRememberMe
    end
  end
end

Then("[Mweb][Prod] user can see error message {string} on the username field") do |message|
  @page.voila_homepage.msgErrorEmptyCredentialsIsVisible(message)
end

Then("[Mweb][Prod] user can see error message {string} on the password field") do |message|
  @page.voila_homepage.msgErrorEmptyCredentialsIsVisible(message)
end

When('[Mweb][Prod] user success to open pop up Chat via Telegram from login page') do
  @page.voila_homepage.validatePopUpChatTelegram
end

When('[Mweb][Prod] user clicks on CTA {string} on pop up Chat via Telegram from login page') do |listAdmin|
  case listAdmin
  when "Admin Sales"
    @page.voila_homepage.clicksBtnChatAdminSales
  when "Admin Gudang"
    @page.voila_homepage.clicksBtnChatAdminWarehouse
  end
end

When('[Mweb][Prod] user click button privacy and return policy on the login page') do
  @page.voila_homepage.clicksBtnPrivacyReturnPolicy
end

When('[Mweb][Prod] user click tab {string} on new tab privacy and return policy page from the login page') do |tab|
  case tab
  when "Privacy Policy"
    @page.voila_homepage.clicksBtnPrivacyPolicy
  when "Return Policy"
    @page.voila_homepage.clicksBtnReturnPolicy
  end
end

Then('[Mweb][Prod] user will see tab {string} on new tab privacy and return policy page from the login page') do |tab|
  case tab
  when "Privacy Policy"
    @page.voila_homepage.validatePrivacyPolicy
  when "Return Policy"
    @page.voila_homepage.validateReturnPolicy
  end
end

When('[Mweb][Prod] user will redirected to new tab privacy and return policy page') do
  if ENV["BROWSER"] == "chrome"
    wait_in_sec get_config_data('ASSERT_URL_WAIT_TIME')
    switch_to_new_tab
    expect(URI.parse(current_url)).to have_content("/privacy-policy")
  else
    wait_in_sec get_config_data('ASSERT_URL_WAIT_TIME')
    switch_to_last_window
    expect(URI.parse(current_url)).to have_content("/privacy-policy")
  end
end

When("[Mweb][Prod] user close pop up banner if exits") do
  @page.voila_homepage.checkAndClickPopUpBanner
end
