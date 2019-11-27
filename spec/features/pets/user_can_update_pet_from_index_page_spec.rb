require 'rails_helper'

RSpec.describe "update pet from index" do
  it "has update link from index" do
    shelter_2 = Shelter.create(name: "Big Sky Dog Ranch", address: "2012 County Road 3", city: "Hamilton", state: "MT", zip: "55533")
    pet_3 = Pet.create(name: "Ginny", age: "3", sex: "Female", shelter_id: "#{shelter_2.id}", image: "https://fortunedotcom.files.wordpress.com/2019/01/boo.jpg")

    visit '/pets'
    click_on "Update Pet Info"
    expect(current_path).to eq("/pets/#{pet_3.id}/edit")
    fill_in :name, with: "Fido"
    fill_in :age, with: "9"
    fill_in :sex, with: "Male"

    click_on "Submit"

    expect(current_path).to eq("/pets/#{pet_3.id}")

    expect(page).to have_content("Fido")
    expect(page).to have_content("9")
    expect(page).to have_content("Male")
    expect(page).to have_css("img[src*='#{pet_3.image}']")
  end
end
