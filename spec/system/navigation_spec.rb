require 'spec_helper'

RSpec.describe "Navigation", type: :system do
  it "has useful pages" do
    visit "/"

    expect(page).not_to have_link("Harvest API Docs")

    click_on "Job Board API Docs"
    expect(page).to have_content("With our Job Board API, you will have easy access to a simple JSON representation of your company's offices, departments, and published jobs.")

    click_on "Onboarding API"
    expect(page).to have_content("Our Greenhouse Onboarding API allows you to query and modify your employee, and query company information.")
  end
end
