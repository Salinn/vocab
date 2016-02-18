require "rails_helper"

feature 'Create a course' do
  scenario 'Log in as teacher', :js => true do
    teacher = FactoryGirl.create(:teacher)
    visit '/'
    fill_in 'user_email', with: teacher.email
    fill_in 'user_password', with: teacher.password
    click_button 'Log in'
    expect(page.body).to have_content 'Teacher'
  end

  scenario 'Create a new course', :js => true do
    teacher = FactoryGirl.create(:teacher)
    course = FactoryGirl.create(:course)
    visit '/'
    fill_in 'user_email', with: teacher.email
    fill_in 'user_password', with: teacher.password
    click_button 'Log in'
    expect(page.body).to have_content 'Teacher'

    #click create course
    find(:xpath, '//*[@id="create_course"]/a/i').click

    expect(page.body).to have_content 'Create a new course'
    expect(page.body).to have_content 'Description'
    expect(page.body).to have_content 'Class name'
    expect(page.body).to have_content 'Syllabus'
    expect(page.body).to have_button 'Create Course'

    fill_in 'course_class_name', with: course.class_name
    page.execute_script("$('#course_end_date').val('#{course.start_date}')")
    page.execute_script("$('#course_start_date').val('#{course.end_date}')")
    click_button 'Create Course'

    #validate content
    expect(page.body).to have_content "Class name: #{course.class_name}"
    expect(page.body).to have_button 'Duplicate Class'
    expect(page.body).to have_button 'Share Class'

    #Course Created, navigate to teachers tab and validate course is present


    #validate extra course items are added to the sidebar


  end

end
