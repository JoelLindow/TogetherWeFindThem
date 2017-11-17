require 'rails_helper'

describe 'user visits root path' do
  it 'user sees basic page content' do

    # As an unregistered user
    # when I visit '/'
    visit '/'
    # I see a greeting and a mission statement
    expect(page).to have_css('.greeting_root_block')
    # and I see a link to go to the list of missing persons (does not need to function in this story)
    expect(page).to have_css('.missing_persons_root_block')
    expect(page).to have_content("Continue as unregistered user")
    # and I see a place to click and go to the site blog (does not need to function in this story)
    expect(page).to have_css('.visit_blog_root_block')
    expect(page).to have_content("Visit the Blog")
    # and I see an option to log in or create an account (does not need to function in this story)
    expect(page).to have_css('.login_create_root_block')
    expect(page).to have_content("Login")
    # And I see a button to 'log in' on the navbar (log in button is not required to function in this user story)
    save_and_open_page

    expect(page).to have_content("Members Login")
  end
end
