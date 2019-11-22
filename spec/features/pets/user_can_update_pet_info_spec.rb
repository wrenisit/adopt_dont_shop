require 'rails_helper'

RSpec.describe "update pet in shelter" do
  it "can update the pet information" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg", description: "Very mild mannered")

    visit "/pets/#{pet_1.id}"
    expect(page).to have_content("Fred")
    expect(page).to have_content("2")
    expect(page).to have_content("Male")
    expect(page).to have_content("Denver Dog Rescue")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content("adoptable")
    expect(page).to have_content("Very mild mannered")

    click_on "Update"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in "Image", with: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg"
    fill_in "Name", with: "Freud"
    fill_in "Age", with: 20
    fill_in "Sex", with: "Male"
    fill_in "Description", with: "Not good with cats"

    click_on "Submit"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Freud")
    expect(page).to have_content("20")
    expect(page).to have_content("Male")
    expect(page).to have_content("Denver Dog Rescue")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content("adoptable")
    expect(page).to have_content("Not good with cats")
    expect(page).to_not have_content("Very mild mannered")
  end
end


# When I visit a Pet Show page
# Then I see a link to update that Pet
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
