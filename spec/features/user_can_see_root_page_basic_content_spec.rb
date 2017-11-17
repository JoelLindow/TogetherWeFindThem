require 'rails_helper'

describe 'user visits root path' do
  it 'clicks continue to dashboard and user sees basic page content' do

    # As an unregistered user
    # when I visit '/'
    visit '/'
    expect(page).to have_content("Continue as unregistered user")
    click_link "Continue as unregistered user"
    # I see a greeting and a mission statement
    expect(current_path).to eq '/dashboard'
    # expect(page).to have_css('.greeting_dashboard_block')
    # and I see a link to go to the list of missing persons (does not need to function in this story)
    expect(page).to have_css('.missing_people_dashboard_block')
    # and I see a place to click and go to the site blog (does not need to function in this story)
    expect(page).to have_css('.visit_blog_dashboard_block')
    expect(page).to have_content("Visit the Blog")
    # and I see an option to log in or create an account (does not need to function in this story)

    expect(page).to have_content("Members Login")
  end
end
