Given("[Desktop] user desktop user visit voila homepage") do
  @page.voila_homepage.load
end

Given("[Desktop] user visit google") do
  visit 'https://google.co.id'
end

When("[Desktop] user will directed to {string}") do |url|
  expect(current_url).to include(url)
end
