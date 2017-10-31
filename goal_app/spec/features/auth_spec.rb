require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before(:each) { visit new_user_url }
  let(:user) { FactoryBot.build(:user) }
  scenario 'has a new user page' do
    expect(page).to have_content("New User")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Sign Up"
      expect(page).to have_content(user.username)
    end

  end
end

feature 'logging in' do
  let(:user) { FactoryBot.create(:user) }
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content(user.username)
  end

end

feature 'logging out' do

  before(:each) { visit new_session_url }

  scenario 'begins with a logged out state' do
    expect(page).to_not have_button("Log Out")
  end

  let(:user) { FactoryBot.create(:user) }
  
  scenario 'doesn\'t show username on the homepage after logout' do
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_button("Log Out")
    click_on('Log Out')
    expect(page).to_not have_content(user.username)
  end

end
