module LocatorRegisterPage
  # Button
  BUTTON_CHECKBOX_NEWSLETTER ||= "//button[@data-test-id='CT_component_checkbox_subscribe']"
  BUTTON_REGISTER ||= "//button[@data-test-id='CT_component_register_submit']"
  BUTTON_TERMS_OF_SERVICE ||= "//a[text()='Terms of Service']"
  BUTTON_PRIVACY_POLICY ||= "//a[@class='_5y0pl50 _5y0pl5f _5y0pl5a' and text()='Privacy Policy']"
  BUTTON_SIGN_IN ||= "//a[text()='Sign In']"

  # TextField
  TEXT_FIELD_EMAIL_OR_PHONE ||= "//input[@data-test-id='CT_component_identifier_input']"
  TEXT_FIELD_PASSWORD ||= "//input[@data-test-id='CT_component_password_input']"

  # Component
  HEADER_BANNER_REGISTER ||= "//div[@data-test-id='CT-header-banner']"
  LOGO_VOILA_REGISTER ||= "//img[@src='/static/voila-logo.svg']"
  PLACEHOLDER_REGISTER ||= "//p[@id='base' and text()='Register']"
  PLACEHOLDER_ALREADY_REGISTER ||= "//p[text()='Already registered?']"
  INFO_BENEFITS ||= "//p[text()='Become a voilà.id member and' and text()='enjoy the benefits']"
  USP_INFO_BENEFITS_1 ||= "//p[@id='base' and text()='100% Authentic']"
  SUBTITLE_USP_INFO_BENEFITS_1 ||= "//p[@id='base' and text()='Get 100% authentic luxury items delivered to you.']"
  USP_INFO_BENEFITS_2 ||= "//p[@id='base' and text()='Voucher Discount 500K']"
  SUBTITLE_USP_INFO_BENEFITS_2 ||= "//p[@id='base' and text()='Register an account and enjoy 500k voucher for your first order.']"
  USP_INFO_BENEFITS_3 ||= "//p[@id='base' and text()='Purchase History']"
  SUBTITLE_USP_INFO_BENEFITS_3 ||= "//p[@id='base' and text()='Track all of your online orders and in-boutique purchases.']"
end
