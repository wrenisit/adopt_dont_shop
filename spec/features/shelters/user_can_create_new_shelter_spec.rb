require 'rails_helper'

RSpec.describe "shelter create page", type: :feature do
  it "can have form to add shelter" do
    visit "/shelters/new"
    fill_in "Name", with: "Austin Corgy Rescue"
    fill_in "Address", with: "456 Oak Street"
    fill_in "City", with: "Austin"
    fill_in "State", with: "TX"
    fill_in "Zip", with: "78704"

    expect(page).to have_content(form)
  end
end
