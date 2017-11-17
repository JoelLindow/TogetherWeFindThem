require 'rails_helper'

feature 'User' do
  context 'Twitter OAuth' do
    scenario 'can log in with twitter credentials' do
      stub_twitter

      visit login_path

      expect(page).to have_selector(:css, 'a[href="/auth/twitter"]')

      click_on('Sign in with Twitter')

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_selector(:css, 'a[href="/missing_persons"]')
      expect(User.last.name).to eq('Sam Lim')
      expect(User.last.first_name).to eq('Sam')
      expect(User.last.last_name).to eq('Lim')
      expect(User.last.email).to eq("limsammy1@gmail.com")

    end
  end
end
