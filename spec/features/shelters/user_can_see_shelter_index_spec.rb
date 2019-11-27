require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelters" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    shelter_2 = Shelter.create(name: "Denver Cat Rescue", address: "123 West Street", city: "Denver", state: "CO", zip: "80121")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(shelter_2.name)
  end
end
