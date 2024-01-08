Then("[Desktop] user see all component on register page") do
  wait_for_ajax
  @page.register_page.all_component_on_register_page
end
