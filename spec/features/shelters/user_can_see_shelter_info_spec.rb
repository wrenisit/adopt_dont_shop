require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can show a specific shelter page" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    shelter_2 = Shelter.create(name: "Denver Cat Rescue", address: "123 West Street", city: "Denver", state: "CO", zip: "80121")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    expect(page).to_not have_content(shelter_2.name)
  end
end
