require 'rails_helper'

feature 'Admin' do
  scenario 'Log in as admin', :js => true do
    admin = FactoryGirl.create(:admin)
#    visit '/'
#    fill_in 'user_email', with: admin.email
#    fill_in 'user_password', with: admin.password
#    click_button 'Log in'
  end

  scenario 'Add teacher role', :js => true do

  end

  scenario 'Add student role', :js => true do

  end

end