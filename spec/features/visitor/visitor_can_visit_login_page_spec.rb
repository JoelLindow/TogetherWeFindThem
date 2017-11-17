require 'rails_helper'

RSpec.feature "visitor visits /" do
  scenario "visitor sees navbar and login button" do
    visit login_path

    within(:css, ".navbar") do
      expect(page).to have_content("Members Login")
    end
  end

  scenario "visitor clicks login button" do
    visit root_path
    
    click_link "Members Login"

    expect(current_path).to eq(login_path)
  end

  scenario "visitor visits login path" do
    stub_omniauth
    visit login_path

    expect(page).to have_content("Sign in with Google")
    # Other assertions for other omniauth services here

    click_link "Sign in with Google"

    expect(page).to have_content("Welcome back, Sam Lim!")
    expect(page).to have_content("Logout")
    expect(current_path).to eq(dashboard_index_path)
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: "google_oauth2",
      uid: "12345678910",
      info: {
        email: "limsammy1@gmail.com",
        first_name: "Sam",
        last_name: "Lim"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "abcdefg12345",
        expires_at: DateTime.now,
      }
    })
end
# As a registered user who is not logged in
# when I visit the '/' page
# and I click the "Login" link on the navbar"
# I am taken to the '/login' page
# and I click the "Sign in with Google" button
# and I am taken to the '/dashboard' page
# and I see a flash message that says "Welcome Back Username"
