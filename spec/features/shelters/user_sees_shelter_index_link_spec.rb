require 'rails_helper'

RSpec.describe "shelter index links" do
  it "has a shelter index link" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg")

    visit '/pets'
    click_link "Shelter Index"
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("#{shelter_1.name}")

    visit "/pets/#{pet_1.id}"
    click_link "Shelter Index"
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("#{shelter_1.name}")

    visit "/shelters/#{shelter_1.id}/pets/new"
    click_link "Shelter Index"
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("#{shelter_1.name}")

    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Shelter Index"
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("#{shelter_1.name}")

    visit "/pets/#{pet_1.id}/edit"
    click_link "Shelter Index"
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("#{shelter_1.name}")
  end
end

# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Shelter Index
