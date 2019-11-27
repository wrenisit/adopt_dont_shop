require 'rails_helper'

RSpec.describe "Shelter links" do
  it "has shelter names as links to their show pages" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg")

    visit '/shelters'
    click_link "#{shelter_1.name}"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit "/pets/#{pet_1.id}"
    click_link "#{shelter_1.name}"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit '/pets'
    click_link "#{shelter_1.name}"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end
end
