require 'rails_helper'

RSpec.feature "user can send a message to another user" do
  describe "user navigates to other user's page" do
    it "user sees user info" do
      receipient = User.create(first_name: 'John', last_name: 'Doe')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(receipient)

      visit user_path(receipient)

      expect(current_path).to eq("/users/#{receipient.id}")
      expect(page).to have_content("Viewing John's Profile")
    end

    it "user sees send message link in mailbox" do
      user = User.create!(first_name: 'Test', last_name: 'Test')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit conversations_path

      expect(page).to have_content("Send Message")

      click_on "Send Message"

      fill_in 'Subject', with: 'Test Subject'
      fill_in 'Message', with: 'Test Message'

      select user.name, from: 'recipients'

      click_on "Send"

      expect(page).to have_content("Test Subject")
      expect(page).to have_content("Test Message")
    end
  end
end