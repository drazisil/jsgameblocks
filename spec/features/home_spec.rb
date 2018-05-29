require 'spec_helper'

Capybara.server = :webrick
Capybara.default_driver = :selenium_chrome_headless

class Home
  include Capybara::DSL
  def visit_homepage
    Capybara.app = Rack::File.new('.')
    visit("index.html")
  end
end
feature "Visit homepage" do
  let(:home) {Home.new}
  scenario "Able to see text, Word Nerds", :js => true do
    home.visit_homepage
    page.save_screenshot('screenshot.png')
    expect(page).to have_xpath("//canvas")
  end
end