require 'rails_helper'

RSpec.describe "pet index link" do
  it "has pet index link on all pages" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg", description: "Very mild mannered")

    visit '/shelters'
    click_link "Pet Index"
    expect(current_path).to eq('/pets')

    visit "/pets/#{pet_1.id}"
    click_link "Pet Index"
    expect(current_path).to eq('/pets')

    visit "/pets/#{pet_1.id}/edit"
    click_link "Pet Index"
    expect(current_path).to eq('/pets')
  end
end
