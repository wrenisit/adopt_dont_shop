require 'rails_helper'

RSpec.describe "user can use button on shelter index page to delete shelter" do
  it "has delete button on shelter index page" do
    shelter_1 = Shelter.create(name: "Denver Dog Rescue", address: "123 South Street", city: "Denver", state: "CO", zip: "80121")

    visit '/shelters'

    click_link "Delete"
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Denver Dog Rescue")

  end
end


# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter
