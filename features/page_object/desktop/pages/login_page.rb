require_relative '../../base/base_page'
require_relative '../locator/locator_login_page'

class LoginPage < SitePrism::Page
  include BasePage
  include LocatorLoginPage

  config = get_config_data('web')['voila-homepage']
  set_url(config['url'] + config['path']['login'])

  element :header_banner_sign_in, :xpath, HEADER_BANNER_SIGN_IN
  element :logo_voila_sign_in, :xpath, LOGO_VOILA_SIGN_IN
  element :placeholder_sign_in, :xpath, PLACEHOLDER_SIGN_IN
  element :info_message_sign_in, :xpath, INFO_MESSAGE_SIGN_IN
  element :login_input_email_or_phone, :xpath, TEXT_FIELD_EMAIL_OR_PHONE
  element :login_input_password, :xpath, TEXT_FIELD_PASSWORD
  element :sign_in_button, :xpath, BUTTON_SIGN_IN
  element :google_sso_button, :xpath, BUTTON_GOOGLE_SSO
  element :facebook_sso_button, :xpath, BUTTON_FACEBOOK_SSO
  element :placeholder_dont_have_account, :xpath, PLACEHOLDER_DONT_HAVE_ACCOUNT
  element :register_button, :xpath, BUTTON_REGISTER

  def input_email_or_phone(email_or_phone)
    login_input_email_or_phone.should be_visible
    login_input_email_or_phone.send_keys(email_or_phone)
  end

  def input_password(password)
    login_input_password.should be_visible
    login_input_password.send_keys(password)
  end

  def click_sign_in_button
    wait_for_ajax
    sign_in_button.should be_visible
    sign_in_button.click
  end

  def voila_loader
    element_does_not_exist?(:xpath, LOADER_SIGN_IN_VOILA)
  end

  def all_component_on_login_page
    header_banner_sign_in.should be_visible
    logo_voila_sign_in.should be_visible
    placeholder_sign_in.should be_visible
    info_message_sign_in.should be_visible
    login_input_email_or_phone.should be_visible
    sign_in_button.should be_visible
    expect(sign_in_button).to be_disabled
    google_sso_button.should be_visible
    facebook_sso_button.should be_visible
    placeholder_dont_have_account.should be_visible
    register_button.should be_visible
  end
end
