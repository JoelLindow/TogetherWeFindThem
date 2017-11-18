require 'rails_helper'

RSpec.feature "user can view sentbox" do
  describe "user goes to mailbox" do
    it "user sees sentbox link" do
      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit conversations_path

      expect(page).to have_content("Sent Messages")
    end

    it "user clicks sentbox and views it" do
      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit conversations_path

      click_link "Sent Messages"

      expect(current_path).to eq(conversations_path)
    end
  end
end