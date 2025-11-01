require 'spec_helper'

RSpec.describe "Navigation", type: :system do
  it "has useful pages" do
    visit "/"

    click_on "Harvest API Docs"
    expect(page).to have_content("With Harvest, you have access to most of your Greenhouse data!")

    click_on "Onboarding API"
    expect(page).to have_content("Our Greenhouse Onboarding API allows you to query and modify your employee, and query company information.")
  end
end
