require_relative '../../base/base_page'
require_relative '../locator/locator_login_page'

class LoginPage < SitePrism::Page
  include BasePage
  include LocatorLoginPage

  element :login_input_email_or_phone, :xpath, TEXT_FIELD_EMAIL_OR_PHONE
  element :login_input_password, :xpath, TEXT_FIELD_PASSWORD
  element :sign_in_button, :xpath, BUTTON_SIGN_IN

  def input_email_or_phone(email_or_phone)
    login_input_email_or_phone.should be_visible
    login_input_email_or_phone.send_keys(email_or_phone)
  end

  def input_password(password)
    login_input_password.should be_visible
    login_input_password.send_keys(password)
  end

  def click_sign_in
    sign_in_button.should be_visible
    sign_in_button.click
  end

  def voila_loader
    element_does_not_exist?(:xpath, LOADER_SIGN_IN_VOILA)
  end
end
