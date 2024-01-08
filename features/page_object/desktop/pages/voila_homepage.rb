require_relative '../../base/base_page'

class VoilaHomepage < SitePrism::Page
  include BasePage

  config = get_config_data('web')['voila-homepage']
  set_url(config['url'])
end
