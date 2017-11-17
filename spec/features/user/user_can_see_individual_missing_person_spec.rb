require 'rails_helper'

describe "user visits dashboard" do
  it "user can go to and view individual missing persons report" do
    person = MissingPerson.create!(
                                first_name: "John",
                                last_name: "Doe",
                                age: 21,
                                sex: "Male",
                                eye_color: "Brown",
                                hair_color: "Blonde",
                                skin_color: "White",
                                race: "Caucasian",
                                other_phys_features: "Hairy mole on left cheek.",
                                last_seen_city: "Denver",
                                last_seen_state: "Colorado",
                                last_seen_place: "Union Station",
                                last_seen_with: "Uncle Joey. 6foot 3inches albino with red hair",
                                other_information: "Last seen in Uncle Joeys Black Monte Carlo")
    # as a user
    # when I visit '/dashboard'
    visit '/dashboard'
    # and I click on the "Help Find Us" link
    click_link("Help Find Us")
    # and I am taken to the '/missing' page
    expect(current_path).to eq('/missing_persons')
    # Then I click on the name of a person listed
    click_link("John Doe")
    # and I am taken to that person's individual showpage '/missing/slugged-name'
    expect(current_path).to eq("/missing_persons/#{person.id}")
    # and I see the missing persons picture
    expect(page).to have_css(".person_image")
    # and I see the missing persons name (combo of first name and last name)
    expect(page).to have_content("Name: John Doe")
    # and I see the persons age
    expect(page).to have_content("Age: 21")
    # and I see the persons sex
    expect(page).to have_content("Sex: Male")
    # and I see the persons eye_color
    expect(page).to have_content("Eye Color: Brown")
    # and I see the persons hair_color
    expect(page).to have_content("Hair Color: Blonde")
    # and I see the persons skin_color
    expect(page).to have_content("Skin Color: White")
    # and I see the last city and state the person was seen in
    expect(page).to have_content("City Last Seen: Denver, Colorado")
    # and I see the last place the person was seen at
    expect(page).to have_content("Last Place Seen: Union Station")
    # and I see the last date that this person was seen
    expect(page).to have_content("Last Seen With:")
    expect(page).to have_content("Uncle Joey. 6foot 3inches albino with red hair")
    # and I see other information about the person (this is where people add any other details they think might be important)
    expect(page).to have_content("Other Information:")
    expect(page).to have_content("Last seen in Uncle Joeys Black Monte Carlo")
  end
end
