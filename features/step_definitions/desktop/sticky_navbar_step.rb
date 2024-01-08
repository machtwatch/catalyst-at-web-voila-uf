When("[Desktop] user click {string} button on sticky navbar") do |button|
  wait_for_ajax
  button.eql?("Sign In") ?
      @page.sticky_navbar.click_sign_in_button :
      @page.sticky_navbar.click_register_button
end

Then("[Desktop] user verify {string} sign in button on sticky navbar") do |status|
  wait_for_ajax
  status.eql?("see") ?
      @page.sticky_navbar.is_sign_in_button_appear.equal?(true) :
      @page.sticky_navbar.is_sign_in_button_appear.equal?(false)
end

When("{string}") do |arg|
end
