require 'rails_helper'

RSpec.describe "pet links" do
  it "shows pet names as links to pet show page" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg", description: "Very mild mannered")

    visit '/pets'
    click_link "#{pet_1.name}"
    expect(current_path).to eq("/pets/#{pet_1.id}")

    visit "/shelters/#{shelter_1.id}/pets"
    click_link "#{pet_1.name}"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    
  end
end

# When I click on the name a pet anywhere on the site
# Then that link takes me to that Pet's show page
