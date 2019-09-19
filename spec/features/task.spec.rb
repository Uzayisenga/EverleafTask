# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
 scenario "Test task list" do
    # Create two tasks in advance to use in the task list test
    Task.create!(name: 'test_task_01', content: 'testtesttest')
    Task.create!(name: 'test_task_02', content: 'samplesample')

  # visit to tasks_path (transition to task list page)
    visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
    
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample' 
    save_and_open_page

  end

  scenario "Test task creation" do
    visit new_task_path
    fill_in "Name", with: "Names"
    fill_in "Content", with: "Contents"
    fill_in "Status", with: "Status"
    fill_in "Priority", with: "Priorities"
    click_on "Create Task"
    expect(page).to have_text('Task was successfully created.') 
  end

  scenario "Test task details" do
    visit tasks_path
    fill_in "Name", with: "Names"
    fill_in "Content", with: "Contents"
    fill_in "Status", with: "Status"
    fill_in "Priority", with: "Priorities"
    click_on "Create Task"
    click_on "Back"
    click_on "Show"
    
    
    expect(page).to have_content("Contents")
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Write test content here
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_03', content: 'samplesample')
  end
end