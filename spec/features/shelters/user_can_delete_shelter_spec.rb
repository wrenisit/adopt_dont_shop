require 'rails_helper'

RSpec.describe "delete a shelter" do
  it "can delete a shelter" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    shelter_2 = Shelter.create(name: "Denver Cat Rescue", address: "123 West Street", city: "Denver", state: "CO", zip: "80121")

    visit "/shelters/#{shelter_1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Denver Dog Rescue")
    expect(page).to_not have_content("123 South Street")
  end
end
