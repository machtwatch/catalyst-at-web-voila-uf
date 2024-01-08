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

  def register_page
    load(RegisterPage.new, nil)
  end

  def verification_method_popup
    load(VerificationMethodPopup.new, nil)
  end
end
