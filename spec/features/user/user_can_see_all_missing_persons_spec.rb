require 'rails_helper'

describe 'user visits site' do
  it 'navigates to /missing and can see all missing persons' do
    person1 = MissingPerson.create!(
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
                                last_seen_with: "Uncle Joey",
                                other_information: "Last seen in Uncle Joeys Black Monte Carlo")

    person2 = MissingPerson.create!(
                                first_name: "Jane",
                                last_name: "Dae",
                                age: 18,
                                sex: "Female",
                                eye_color: "Brown",
                                hair_color: "Black",
                                skin_color: "Brown",
                                race: "African American",
                                other_phys_features: "Wearing Braces",
                                last_seen_city: "Seattle",
                                last_seen_state: "Washington",
                                last_seen_place: "State Capital",
                                last_seen_with: "Aunt on Capital Steps",
                                other_information: "Possibly sighted with older woman in white Ford Econoline van")

    # as an unregistered user
    # when I visit '/'
    visit login_path
    # and I click on the "Continue as unregistered user" link
    click_on "Continue as unregistered user"
    # Then I am taken to the dashboard page
    expect(current_path).to eq(dashboard_index_path)
    # and I click on the "Help Find Us" link
    click_on "Help Find Us"
    # and I'm taken to the '/missing' page
    expect(current_path).to eq(missing_persons_path)
    # and I see a collection of pictures and names of missing people
    expect(page).to have_css(".missing_person_card")
    expect(page).to have_css(".person_image")
    expect(page).to have_css(".person_name")
    expect(page).to have_content("John Doe")
    expect(page).to have_content("Jane Dae")
  end
end
