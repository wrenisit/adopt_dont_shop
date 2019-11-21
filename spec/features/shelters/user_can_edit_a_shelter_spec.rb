require 'rails_helper'

RSpec.describe "shelter edit page" do
  it "can show a link and edit a shelter" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    shelter_2 = Shelter.create(name: "Denver Cat Rescue", address: "123 West Street", city: "Denver", state: "CO", zip: "80121")

    visit "/shelters/#{shelter_1.id}"
    click_on 'Update'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    fill_in :name, with: "Canine House"
    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content('Canine House')
    expect(page).to_not have_content('Denver Dog Rescue')
  end
end
