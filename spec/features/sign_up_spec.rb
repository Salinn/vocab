require "rails_helper"

feature "Sign Up" do
  scenario 'Sign up', :js => true do
    visit '/'
    click_on 'Sign up'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Password confirmation'

    fill_in 'user_email', with: 'vocab@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'Sign up'

    expect(page.body).to have_content 'Classes'
  end

end