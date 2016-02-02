require 'rails_helper'

feature 'Signing in' do
  scenario 'visit login page' do
    visit '/'
    expect(page).to have_content 'Log in'
  end

  scenario 'sign in with incorrect credentials', :js => true do
    visit '/'
    fill_in 'user_email', :with => 'user@user.com'
    fill_in 'user_password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Log in'
  end

#  scenario 'sign in with correct credentials', :js => true do
#    visit '/'
#    fill_in 'user_email', :with => 'dam6660@rit.edu'
#    fill_in 'user_password', :with => 'topsecret'
#    click_button 'Log in'
#    expect(page).to have_content 'Classes'
#  end
end