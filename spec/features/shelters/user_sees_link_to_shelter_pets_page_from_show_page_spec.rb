require 'rails_helper'

RSpec.describe "see pets link in show page" do
  it "has a link to see the pets in a shelter from its show page" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg", description: "Very mild mannered")

    visit "/shelters/#{shelter_1.id}"
    click_link "#{shelter_1.name}'s Pets"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    

  end
end

# When I visit a shelter show page ('/shelters/:id')
# Then I see a link to take me to that shelter's pets page ('/shelters/:id/pets')
