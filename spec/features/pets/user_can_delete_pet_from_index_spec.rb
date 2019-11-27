require 'rails_helper'

RSpec.describe "user can delete pet" do
  it "has a button to delete a pet from index page" do
    shelter_2 = Shelter.create(name: "Big Sky Dog Ranch", address: "2012 County Road 3", city: "Hamilton", state: "MT", zip: "55533")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_2.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg")

    visit '/pets'

    expect(page).to have_content("Fred")
    expect(page).to have_content("2")
    expect(page).to have_content("Male")
    expect(page).to have_css("img[src*='#{pet_1.image}']")

    click_on 'Delete'

    expect(current_path).to eq('/pets')


    expect(page).to_not have_content("Fred")
    expect(page).to_not have_content("2")
    expect(page).to_not have_content("Male")
    expect(page).to_not have_css("img[src*='#{pet_1.image}']")
  end
end
