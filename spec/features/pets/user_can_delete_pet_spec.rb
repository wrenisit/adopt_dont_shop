require 'rails_helper'

RSpec.describe "delete a pet" do
  it "can delete a pet" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = shelter_1.pets.create(name: "Fred", age: "2", sex: "Male", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg", description: "Very mild mannered")
    pet_2 = shelter_1.pets.create(name: "Ginny", age: "3", sex: "Female", image: "https://fortunedotcom.files.wordpress.com/2019/01/boo.jpg")

    visit "/pets/#{pet_1.id}"

    click_button "Delete"

    expect(current_path).to eq('/pets')
    expect(page).to_not have_content("Fred")
    expect(page).to_not have_content("2")
    expect(page).to_not have_content("Male")

    expect(page).to have_content("Ginny")
    expect(page).to have_content("3")
    expect(page).to have_content("Female")

  end
end

# When I visit a pet show page
# Then I see a link to delete the pet
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
