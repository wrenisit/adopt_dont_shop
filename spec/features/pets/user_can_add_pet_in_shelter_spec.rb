require 'rails_helper'

RSpec.describe "create a pet in a shelter" do
  it "can create a pet in a shelter" do
    shelter_2 = Shelter.create(name: "Big Sky Dog Ranch", address: "2012 County Road 3", city: "Hamilton", state: "MT", zip: "55533")

    visit "/shelters/#{shelter_2.id}/pets"

    click_on 'Add A Pet'

    expect(current_path).to eq("/shelters/#{shelter_2.id}/pets/new")

    fill_in "Image", with: "https://static01.nyt.com/images/2013/12/02/arts/arts2/arts2-articleLarge.jpg?quality=75&auto=webp&disable=upscale"
    fill_in "Name", with: "Bella"
    fill_in "Age", with: 15
    fill_in "Sex", with: "Female"
    fill_in "Description", with: "Ugly"

    click_on 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_2.id}/pets")

    expect(page).to have_content("Bella")
  end
end
