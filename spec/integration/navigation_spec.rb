require 'spec_helper'

describe "Navigation" do
  include Capybara
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  it "should render the .coffee template" do
    visit "/handlers/coffee.js"
    expected = /alert\(\"Hello world\"\);/
    page.body.should match(expected)
  end

  it "should render the .coffeerb template" do
    visit "/handlers/coffeerb.js"
    expected = /alert\(\"Hello from ERB\"\);/
    page.body.should match(expected)
  end
end
