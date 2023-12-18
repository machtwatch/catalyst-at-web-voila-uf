require_relative '../../base/base_page'
require_relative '../locator/locator_sticky_navbar'

class StickyNavbar < SitePrism::Page
  include BasePage
  include LocatorStickyNavbar

  element :sign_in_button, :xpath, BUTTON_SIGN_IN
  element :register_button, :xpath, BUTTON_REGISTER

  def click_sign_in
    sign_in_button.should be_visible
    sign_in_button.click
  end

  def click_register
    register_button.should be_visible
    register_button.click
  end

  def is_button_sign_in_appear
    return validate_element_not_found(BUTTON_SIGN_IN)
  end

end
