require 'rails_helper'

feature 'User' do
  context 'Facebook oAuth' do
    scenario 'user can log into app with Facebook credentials' do
      stub_facebook

      visit login_path

      expect(page).to have_selector(:css, 'a[href="/auth/facebook"]')

      click_on('Sign in with Facebook')

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_selector(:css, 'a[href="/missing_people"]')
      expect(User.last.name).to eq('Sam Lim')
      expect(User.last.first_name).to eq('Sam')
      expect(User.last.last_name).to eq('Lim')
      expect(User.last.email).to eq("limsammy1@gmail.com")
    end
  end
end
