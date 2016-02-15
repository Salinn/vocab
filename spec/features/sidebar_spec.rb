require 'rails_helper'

feature 'Sidebar Behaviors' do
  background do
    visit '/'
  end
  scenario 'Open Sidebar', :js => true do
    find('#menu-toggle').click
    expect(page).to have_content 'Vocab'
  end

  scenario 'Close sidebar', :js => true do
    find('#menu-toggle').click
    expect(page).to_not have_content 'Vocab'
  end

  scenario "Validate navigation links", :js => true do

  end
end