require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2 'omniauth'" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"

    expect(page).to have_content("Sam Lim")
    expect(page).to have_content("Logout")
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