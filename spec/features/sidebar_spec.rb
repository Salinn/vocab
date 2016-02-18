require 'rails_helper'

feature 'Sidebar Behaviors' do
  background do
    visit '/'
  end
  scenario 'Open Sidebar', :js => true do
    find('#main_icon').click
    expect(page).to have_selector '#wrapper.active'
  end

  scenario 'Close sidebar', :js => true do
    find('#main_icon').click
    expect(page).to_not have_selector '#wrapper.active'
  end

  scenario "Validate navigation links", :js => true do

  end

  def close_sidebar
    if page.find(:css, '#wrapper.active')
      find('#main_icon').click
    end
  end
end