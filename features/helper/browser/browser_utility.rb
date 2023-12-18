def set_browser_resolution_to(width, height)
  Capybara.page.current_window.resize_to(width, height)
end

def set_browser_resolution_to_maximize
  if @tags.include? '@mweb'
    set_browser_resolution_to ENV['MWEB_WIDTH'], ENV['MWEB_HEIGHT']
  elsif @tags.include? '@desktop'
    Capybara.page.current_window.maximize
  end
end

def wait_in_sec(number_in_second)
  sleep number_in_second.to_i
end

def switch_to_window_title(page_title)
  switch_to_window { title == page_title }
end

def switch_to_first_window
  page.switch_to_window(page.windows.first)
end

def switch_to_last_window
  page.switch_to_window(page.windows.last)
end

def refresh_page
  Capybara.current_session.driver.execute_script("window.location.reload()")
end

def execute_js_script(script)
  Capybara.current_session.driver.execute_script(script)
end

def close_current_tab
  Capybara.current_session.driver.execute_script("window.close();")
end

def switch_to_previous_page
  page.go_back
end

def switch_to_next_page
  page.go_forward
end

def save_state_on_current_page
  page.driver.browser.window_handle
end

def switch_state_by_session(session)
  page.driver.browser.switch_to.window(session)
end

def switch_state_to_popup_browser
  page.driver.browser.switch_to.alert
end

def handle_alert_popup_browser(action)
  if (action.eql?('accept'))
    page.driver.browser.switch_to.alert.accept
  else
    page.driver.browser.switch_to.alert.dismiss
  end
end

def finished_all_ajax_requests?
  driver = Capybara.current_session.driver
  wait = Selenium::WebDriver::Wait.new(timeout: 15)
  wait.until { driver.execute_script('return document.readyState') == 'complete' }
  page.evaluate_script('jQuery.active').zero? rescue true
end

def wait_for_ajax
  wait_in_sec 1
  Capybara.default_max_wait_time = 15
  Timeout.timeout(Capybara.default_max_wait_time) do
    loop until finished_all_ajax_requests?
  end
end
