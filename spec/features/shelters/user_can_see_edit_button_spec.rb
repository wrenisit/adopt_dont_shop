require 'rails_helper'

RSpec.describe "user can click button to get to shelter edit page" do
  it "has button to edit shelter" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")

    visit '/shelters'
    click_on "Update"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Washington Wags"
    fill_in :address, with: "2222 Bee Street"
    fill_in :city, with: "Monroe"
    fill_in :state, with: "WA"
    fill_in :zip, with: "33321"

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Washington Wags")
    expect(page).to have_content("2222 Bee Street")
    expect(page).to have_content("Monroe")
    expect(page).to have_content("WA")
    expect(page).to have_content("33321")

    expect(page).to_not have_content("Denver Dog Rescue")
    expect(page).to_not have_content("123 South Street")
    expect(page).to_not have_content("Denver")
    expect(page).to_not have_content("CO")
    expect(page).to_not have_content("80121")
  end
end
