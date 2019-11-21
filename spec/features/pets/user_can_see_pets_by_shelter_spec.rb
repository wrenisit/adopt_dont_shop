require 'rails_helper'

RSpec.describe "pets in a shelter" do
  it "can show the pets that are in a shelter" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    shelter_2 = Shelter.create(name: "Big Sky Dog Ranch", address: "2012 County Road 3", city: "Hamilton", state: "MT", zip: "55533")

    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg")
    pet_2 = Pet.create(name: "George", age: "5", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1094874726.png?crop=0.542xw:0.814xh;0.0472xw,0.127xh&resize=640:*")
    pet_3 = Pet.create(name: "Ginny", age: "3", sex: "Female", shelter_id: "#{shelter_2.id}", image: "https://fortunedotcom.files.wordpress.com/2019/01/boo.jpg")
    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content("Fred")
    expect(page).to have_content("2")
    expect(page).to have_content("Male")
    expect(page).to have_css("img[src*='#{pet_1.image}']")

    expect(page).to have_content("George")
    expect(page).to have_content("5")
    expect(page).to have_content("Male")
    expect(page).to have_css("img[src*='#{pet_2.image}']")
  end
end
