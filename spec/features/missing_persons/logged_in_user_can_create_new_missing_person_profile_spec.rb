require 'rails_helper'

describe "Logged in user creates a new user profile" do
  it "a user can create a new user profile" do
    # user = User.create!(first_name: "Bob", last_name: "Johnson")
    #
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_missing_person_path

    fill_in "missing_person[first_name]", with: "John"
    fill_in "missing_person[last_name]", with: "Doe"
    fill_in "missing_person[age]", with: 16
    fill_in "missing_person[sex]", with: "Male"
    fill_in "missing_person[eye_color]", with: "Blue"
    fill_in "missing_person[hair_color]", with: "Brown"
    fill_in "missing_person[skin_color]", with: "White"
    fill_in "missing_person[race]", with: "Caucasian"
    fill_in "missing_person[other_phys_features]", with: "Birth Mark on Face"
    fill_in "missing_person[last_seen_city]", with: "Denver"
    fill_in "missing_person[last_seen_state]", with: "Colorado"
    fill_in "missing_person[last_seen_place]", with: "Union Station"
    fill_in "missing_person[last_seen_with]", with: "Uncle Bob"
    fill_in "missing_person[other_information]", with: "Extra Details Listed Here"
    click_button "Create Profile"

    expect(current_path).to eq("/missing_persons/#{MissingPerson.last.id}")

    expect(page).to have_content("John Doe")
    expect(page).to have_content("16")
    expect(page).to have_content("Male")
    expect(page).to have_content("Blue")
    expect(page).to have_content("Brown")
    expect(page).to have_content("White")
    expect(page).to have_content("Caucasian")
    expect(page).to have_content("Birth Mark on Face")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Colorado")
    expect(page).to have_content("Union Station")
    expect(page).to have_content("Uncle Bob")
    expect(page).to have_content("Extra Details Listed Here")

    expect(MissingPerson.all.count).to eq(1)
  end

  xit "a non-logged in user can not create new missing person profile" do
    puts "!!!!!!!!!!!! NEED TO WRITE IN AUTHENTICAION FOR THIS TO WORK"
    puts "!!!!!!!!!!!! NEED TO WRITE IN AUTHENTICAION FOR THIS TO WORK"
    puts "!!!!!!!!!!!! NEED TO WRITE IN AUTHENTICAION FOR THIS TO WORK"
    puts "!!!!!!!!!!!! NEED TO WRITE IN AUTHENTICAION FOR THIS TO WORK"
    puts "!!!!!!!!!!!! NEED TO WRITE IN AUTHENTICAION FOR THIS TO WORK"
  end
end
