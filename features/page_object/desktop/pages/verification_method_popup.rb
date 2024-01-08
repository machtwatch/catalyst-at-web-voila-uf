require_relative '../../base/base_page'
require_relative '../locator/locator_verification_method_popup'

class VerificationMethodPopup < SitePrism::Page
  include BasePage
  include LocatorVerificationMethodPopup

  element :use_password_button, :xpath, BUTTON_USE_PASSWORD
  element :send_otp_button, :xpath, BUTTON_SEND_OTP
  element :sign_in_button, :xpath, BUTTON_SIGN_IN
  element :verification_method_popup_input_password, :xpath, TEXT_FIELD_PASSWORD


  def click_use_password_button
    use_password_button.should be_visible
    use_password_button.click
  end

  def click_send_otp_button
    send_otp_button.should be_visible
    send_otp_button.click
  end

  def input_password(password)
    verification_method_popup_input_password.should be_visible
    verification_method_popup_input_password.send_keys(password)
  end

  def click_sign_in_button
    sign_in_button.should be_visible
    sign_in_button.click
  end
end
