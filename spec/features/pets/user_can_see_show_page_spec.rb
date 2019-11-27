require 'rails_helper'

RSpec.describe "see a show page" do
  it "sees a pets show page" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")
    pet_1 = Pet.create(name: "Fred", age: "2", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg")
    pet_2 = Pet.create(name: "George", age: "5", sex: "Male", shelter_id: "#{shelter_1.id}", image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1094874726.png?crop=0.542xw:0.814xh;0.0472xw,0.127xh&resize=640:*")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content("Fred")
    expect(page).to have_content("2")
    expect(page).to have_content("Male")
    expect(page).to have_content("Denver Dog Rescue")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content("adoptable")

    expect(page).to_not have_content("George")
    expect(page).to_not have_content("5")
    expect(page).to_not have_css("img[src*='#{pet_2.image}']")
  end
end
