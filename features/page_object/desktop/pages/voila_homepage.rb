require_relative '../../base/base_page'

class VoilaHomepage < SitePrism::Page
  include BasePage

  path = get_config_data('web')['voila-homepage']['base']
  set_url(path)
end
