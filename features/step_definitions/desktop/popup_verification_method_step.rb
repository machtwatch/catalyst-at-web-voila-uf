When("[Desktop] user choose with {string} on verification method popup") do |button|
  wait_for_ajax
  button.downcase.eql?("OTP") ?
    @page.verification_method_popup.click_send_otp_button :
    @page.verification_method_popup.click_use_password_button
end

When("[Desktop] user fill password {string} on verification method popup") do |password|
  @page.verification_method_popup.input_password(password)
end


When("[Desktop] user click sign in button on verification method popup") do ||
  @page.verification_method_popup.click_sign_in_button
end
