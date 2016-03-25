require 'rails_helper'

feature 'Create a New Word' do
  scenario 'Log in as teacher', :js => true do
    teacher = FactoryGirl.create(:teacher)
    visit '/'
    fill_in 'user_email', with: teacher.email
    fill_in 'user_password', with: teacher.password
    click_button 'Log in'
    expect(page.body).to have_content 'Teacher'
  end

  scenario 'Add new word', :js => true do
    #click add word
    find(:xpath, '//*[@id="add_word"]/a/i').click


    expect(page.body).to have_content 'New Word'
    expect(page.body).to have_content 'Name'
    expect(page.body).to have_button 'Create Word'


    fill_in 'word_name', with: 'Test Word'
    click_button 'Create Word'
  end
end