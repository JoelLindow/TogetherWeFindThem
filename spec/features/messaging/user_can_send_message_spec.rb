require 'rails_helper'

RSpec.feature "user can send a message to another user" do
  describe "user navigates to other user's page" do
    it "user sees user info" do
      receipient = User.create(first_name: 'John', last_name: 'Doe', name: 'John Doe')

      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit user_path(receipient)

      expect(current_path).to eq("/users/#{receipient.id}")
      expect(page).to have_content("Viewing John's Profile")
    end

    it "user sees send message link in mailbox" do
      stub_omniauth

      visit login_path
      click_link "Sign in with Google"

      visit conversations_path


      expect(page).to have_content("Send Message")
    end
  end
end