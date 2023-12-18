$LOAD_PATH.unshift File.expand_path('../../page_object', __FILE__)

require 'base64'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'date'
require 'dotenv'
require 'httparty'
require 'json'
require 'logger'
require 'net/http'
require 'net/http/post/multipart'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'quickchart'
require 'report_builder'
require 'selenium-webdriver'
require 'site_prism'
require 'slack-ruby-block-kit'
require 'slack-ruby-client'
require 'uri'
require 'webdrivers'
require 'yaml'

Dotenv.load
Dotenv.overload(".env.#{ENV['ENV']}")

def get_config_data(key)
  config_data = YAML.load_file("config/data-target-" + ENV["TARGET"].downcase + ".yml")
  return config_data[key]
end

@tags = Array.new
browser = (ENV['BROWSER'] || 'chrome').to_sym
wait_time = 60 * 5
$passed = 0
$failed = 0
$scenario_count = 0
$scenario_name = ""
$feature_count = 0
$feature_name = ""
$start_time = Time.now.to_i

puts "Target    : #{ENV["TARGET"].upcase}"
puts "Browser   : #{browser.upcase}"
if ENV["BROWSER"].upcase == "SAFARI"
  puts "Private   : NO"
  puts "Headless  : NO"
else
  if ENV["PRIVATE"].upcase == "YES" || ENV["PRIVATE"].upcase == "NO"
    puts "Private   : #{ENV["PRIVATE"].upcase}"
  else
    puts "Private   : NO"
  end
  puts "Headless  : #{ENV["HEADLESS"].upcase}"
end

Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  options = Selenium::WebDriver::Firefox::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end
  options.add_preference 'dom.webdriver.enabled', false
  options.add_preference 'dom.webnotifications.enabled', false
  options.add_preference 'dom.push.enabled', false
  options.add_argument('--width=1366')
  options.add_argument('--height=1000')
  if ENV["PRIVATE"].downcase == 'yes'
    options.add_argument('-private')
  end
  options.profile = profile
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time
  Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: options,
      http_client: client,
      )
end

Capybara.register_driver :firefox_mweb do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  options = Selenium::WebDriver::Firefox::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end
  profile['general.useragent.override'] = ENV['MWEB_USER_AGENT']
  options.add_preference 'dom.webdriver.enabled', false
  options.add_preference 'dom.webnotifications.enabled', false
  options.add_preference 'dom.push.enabled', false
  options.add_argument('--width=1366')
  options.add_argument('--height=1000')
  if ENV["PRIVATE"].downcase == 'yes'
    options.add_argument('-private')
  end
  options.profile = profile
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time
  Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: options,
      http_client: client,
      )
end

Capybara.register_driver :safari do |app|
  options = Selenium::WebDriver::Safari::Options.new
  client = Selenium::WebDriver::Remote::Http::Default.new

  client.open_timeout = wait_time
  client.read_timeout = wait_time
  Capybara::Selenium::Driver.new(
      app,
      browser: :safari,
      options: options,
      http_client: client
  )
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless=new')
  end
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-notifications')
  options.add_argument('--window-size=1366,1000')
  if ENV["PRIVATE"].downcase == 'yes'
    options.add_argument('--headless=new')
  end
  # handle basic auth
  options.add_argument('--disable-blink-features=BlockCredentialedSubresources')
  options.add_argument('--disable-blink-features=AutomationControlled')
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time

  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      http_client: client
  )
end

Capybara.register_driver :chrome_mweb do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end
  options.add_argument("-user-agent='#{ENV['MWEB_USER_AGENT']}'")
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-notifications')
  options.add_argument('--window-size=1366,1000')
  if ENV["PRIVATE"].downcase == 'yes'
    options.add_argument('--headless')
  end
  # handle basic auth
  options.add_argument('--disable-blink-features=BlockCredentialedSubresources')
  options.add_argument('--disable-blink-features=AutomationControlled')
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time

  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      http_client: client
  )
end

Capybara.configure do |config|
  config.default_max_wait_time = ENV['MAX_WAIT_TIME'].to_i
  config.default_driver = browser
end

def load_browser
  if ENV['BROWSER'].downcase == "safari"
    browser = (ENV['BROWSER']).to_sym
  else
    if @tags.include? "@mweb"
      browser = (ENV['BROWSER'] + '_mweb' || 'chrome').to_sym
    else
      browser = (ENV['BROWSER'] || 'chrome').to_sym
    end
  end
  Capybara.current_driver = browser
end

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

at_exit do |scenario|
  end_time = Time.now.to_i
  $duration = Time.at(end_time - $start_time).utc.strftime('%H:%M:%S')
  ReportBuilder.configure do |config|
    config.input_path = 'features/support/reports/result-cucumber.json'
    config.report_path = 'features/support/reports/index'
    config.report_title = "Test Result"
    config.additional_info = {
        Domain: get_config_data('DOMAIN_NAME'),
        Browser: ENV['BROWSER'].upcase,
        Environment: ENV['TARGET'].upcase,
        Tags: $tags_run.join(", "),
        "Run at": Time.now.strftime("%d-%m-%Y %H.%M")
    }
    config.include_images = true
  end
  report = ReportBuilder.build_report

  if ENV['SLACK_NOTIF'] == 'yes'
    send_slack_notif
  end
end

def take_screenshot(scenario)
  scenario_name = scenario.name.gsub /[^\w\-]/, ' '
  time = Time.now.strftime("%Y-%m-%d %H%M")
  screenshot_path = 'features/support/failed_png/' + time + ' - ' + scenario_name + '.png'
  Capybara.current_session.driver.save_screenshot(screenshot_path)
  image = open(screenshot_path, 'rb', &:read)
  encoded_image = Base64.encode64(image)
  embed(encoded_image, 'image/png;base64', 'SCREENSHOT')
end

if ENV['SPEED']
  require 'selenium-webdriver'
  module ::Selenium
    module WebDriver
      module Remote
        class Bridge
          alias old_execute execute

          def execute(*args)
            sleep(0.1)
            old_execute(*args)
          end
        end
      end
    end
  end
end
