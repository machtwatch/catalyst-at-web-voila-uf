class Page
  def initialize(tags)
    @tags = tags
  end

  def load(desktop = nil, mweb = nil)
    if @tags.include? '@mweb'
      mweb
    elsif @tags.include? '@desktop'
      desktop
    end
  end

  # ================ Register Page Here ================

  def voila_homepage
    load(VoilaHomepage.new, nil)
  end

  def sticky_navbar
    load(StickyNavbar.new, nil)
  end

  def login_page
    load(LoginPage.new, nil)
  end
end
