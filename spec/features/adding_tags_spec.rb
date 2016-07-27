require 'capybara/rspec'
require './app/models/link'

feature "Adding tags to a links" do
  scenario "Adding a single tag to a link" do
    visit "/links/new_link"
    fill_in "title", with: "BBC"
    fill_in "url", with: "www.bbc.com"
    fill_in "tags", with: "news"

    click_button "Submit"
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')

  end
end
