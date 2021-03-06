require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2 'omniauth'" do
    stub_omniauth

    visit login_path

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"

    expect(page).to have_content("Sam Lim")
    expect(page).to have_content("Logout")
  end
end
