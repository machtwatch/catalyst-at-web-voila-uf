def scroll_page(horizontal, vertical)
  page.execute_script "window.scrollBy(#{horizontal},#{vertical})"
end

def scroll_down(range)
  scroll_page(0, range)
end

def scroll_up(range)
  scroll_page(0, -range)
end

def scroll_right(range)
  scroll_page(range, 0)
end

def scroll_left(range)
  scroll_page(-range, 0)
end

def scroll_to_top
  page.execute_script "window.scrollTo(0,0)"
end

def scroll_to_bottom
  page.execute_script('window.scrollTo(0, document.body.scrollHeight)')
end

def scroll_down_by_coord_window
  size = Capybara.current_session.current_window.size
  horizontal = size.at(0) * 0.30
  vertical = size.at(1)
  scroll_page(horizontal, vertical)
end

def close_window
  window = page.windows.last
  window.close
end

def back_button
  page.evaluate_script("window.history.back()")
end

def scroll_to_element(element)
  execute_script("arguments[0].scrollIntoView(true)", element)
end

def tiny_mce_fill_in(id, with)
  assert_selector("##{id}_ifr")
  js = "tinyMCE.get('#{id}').insertContent('#{with}')"
  page.execute_script(js)
end

def tiny_mce_clear(id)
  assert_selector("##{id}_ifr")
  js = "tinyMCE.get('#{id}').setContent(' ')"
  page.execute_script(js)
end

def maximize_window
  Capybara.current_session.current_window.maximize
end

def scroll_to_element_location(element, locator = nil)
  script_string = "var viewPortHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);" +
                  "var elementTop = arguments[0].getBoundingClientRect().top;" +
                  "window.scrollBy(0, elementTop-(viewPortHeight/2));"
  element = element.nil? ? find(locator) : element
  execute_script(script_string, element)
end

def switch_to_new_tab
  window = page.driver.browser.window_handles
  if window.size > 1
    page.driver.browser.switch_to.window(window.last)
  end
end

def switch_to_first_tab
  window = page.driver.browser.window_handles
  page.driver.browser.switch_to.window(window.first)
end

def close_new_tab
  window = page.driver.browser.window_handles
  if window.size > 1
    page.driver.browser.switch_to.window(window.last)
    page.driver.browser.close
    page.driver.browser.switch_to.window(window.first)
  end
end

def validate_element_not_found(xpath_selector)
  return find(:xpath, xpath_selector).should be_visible
rescue Capybara::ElementNotFound
  return false
end
