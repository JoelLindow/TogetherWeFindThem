require 'rails_helper'

RSpec.feature "user can view mailbox" do
  describe "user goes to mailbox" do
    it "user sees mailbox" do
      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit root_path

      expect(page).to have_content("Mailbox")
    end

    it "user clicks mailbox and views it" do
      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit root_path

      click_link "Mailbox"

      expect(current_path).to eq(conversations_path)
    end
  end
end