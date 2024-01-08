require_relative '../../base/base_page'
require_relative '../locator/locator_register_page'
class RegisterPage < SitePrism::Page
  include BasePage
  include LocatorRegisterPage

  element :header_banner_register, :xpath, HEADER_BANNER_REGISTER
  element :logo_voila_register, :xpath, LOGO_VOILA_REGISTER
  element :placeholder_register, :xpath, PLACEHOLDER_REGISTER
  element :register_input_email_or_phone, :xpath, TEXT_FIELD_EMAIL_OR_PHONE
  element :register_input_password, :xpath, TEXT_FIELD_PASSWORD
  element :checkbox_newsletter_button, :xpath, BUTTON_CHECKBOX_NEWSLETTER
  element :register_button, :xpath, BUTTON_REGISTER
  element :terms_of_service_button, :xpath, BUTTON_TERMS_OF_SERVICE
  element :privacy_policy_button, :xpath, BUTTON_PRIVACY_POLICY
  element :placeholder_already_register, :xpath, PLACEHOLDER_ALREADY_REGISTER
  element :sign_in_button, :xpath, BUTTON_SIGN_IN
  element :info_benefits, :xpath, INFO_BENEFITS
  element :usp_info_benefits_1, :xpath, USP_INFO_BENEFITS_1
  element :subtitle_usp_info_benefits_1, :xpath, SUBTITLE_USP_INFO_BENEFITS_1
  element :usp_info_benefits_2, :xpath, USP_INFO_BENEFITS_2
  element :subtitle_usp_info_benefits_2, :xpath, SUBTITLE_USP_INFO_BENEFITS_2
  element :usp_info_benefits_3, :xpath, USP_INFO_BENEFITS_3
  element :subtitle_usp_info_benefits_3, :xpath, SUBTITLE_USP_INFO_BENEFITS_3

  def all_component_on_register_page
    header_banner_register.should be_visible
    logo_voila_register.should be_visible
    placeholder_register.should be_visible
    register_input_email_or_phone.should be_visible
    register_input_password.should be_visible
    checkbox_newsletter_button.should be_visible
    expect(register_button).to be_disabled
    terms_of_service_button.should be_visible
    privacy_policy_button.should be_visible
    placeholder_already_register.should be_visible
    sign_in_button.should be_visible
    info_benefits.should be_visible
    usp_info_benefits_1.should be_visible
    subtitle_usp_info_benefits_1.should be_visible
    usp_info_benefits_2.should be_visible
    subtitle_usp_info_benefits_2.should be_visible
    usp_info_benefits_3.should be_visible
    subtitle_usp_info_benefits_3.should be_visible
  end
end
