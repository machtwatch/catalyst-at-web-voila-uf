module LocatorLoginPage
  # Button
  BUTTON_SIGN_IN ||= "//button[@data-test-id='CT_component_login_submit']"
  BUTTON_GOOGLE_SSO ||= "//div[@data-test-id='google-wrapper']"
  BUTTON_FACEBOOK_SSO ||= "//button[@data-test-id='CT_Component_SSOFacebookButton']"
  BUTTON_REGISTER ||= "//a[text()='Register here']"

  # TextField
  TEXT_FIELD_EMAIL_OR_PHONE ||= "//input[@data-test-id='CT_component_login_input']"
  TEXT_FIELD_PASSWORD ||= "//input[@data-test-id='CT_component_password_input']"

  # Component
  HEADER_BANNER_SIGN_IN ||= "//div[@data-test-id='CT-header-banner']"
  LOGO_VOILA_SIGN_IN ||= "//img[@src='/static/voila-logo.svg']"
  PLACEHOLDER_SIGN_IN ||= "//p[@id='base' and text()='Sign In']"
  INFO_MESSAGE_SIGN_IN ||= "//p[@id='base' and text()='Sign in to shop with vouchers, track your order, and save your favorite products.']"
  PLACEHOLDER_DONT_HAVE_ACCOUNT ||= "//p[@id='base' and text()='Don’t have an account?']"
  LOADER_SIGN_IN_VOILA ||= "//*[@id='base']/div/canvas"
end
