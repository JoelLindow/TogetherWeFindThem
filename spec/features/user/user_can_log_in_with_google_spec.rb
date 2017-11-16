require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

    })
end

RSpec.feature "user logs in" do
  scenario "using google oauth2 'omniauth'" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"

    expect(page).to have_content("John Doe")
    expect(page).to have_content("Logout")
  end
end