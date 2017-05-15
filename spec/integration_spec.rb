require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add volunteer', {:type => :feature}) do
  it('allows a user to add a volunteer and see details for it') do
    test_project = Project.new({:name => "Stuff", :id => nil})
    test_project.save()
    visit('/')
    click_link('Sign up and volunteer today')
    fill_in('name', :with =>'Dan')
    select('Stuff', from: 'project_id')
    click_button('Submit')
    expect(page).to have_content('Dan')
  end
end

describe('view volunteers added to the project', {:type => :feature}) do
  it('allows a user to add volunteers to a project') do
    test_project = Project.new({:name => "Stuff", :id => nil})
    test_project.save()
    test_volunteer = Volunteer.new({:id=> nil, :name => 'Dan', :project_id => test_project.id()})
    test_volunteer.save()
    visit('/projects')
    click_link(test_project.name())
    expect(page).to have_content(test_volunteer.name())
  end
end
