require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
erb(:index)
end

get('/volunteers/new') do
  erb(:volunteers_form)
end

get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers/:id/edit') do
@volunteers = Volunteer.find(params.fetch("id").to_i())
erb(:volunteers_edit_form)
end

patch('/volunteers/:id')do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @volunteer.update({:first_name=>first_name, :last_name=>last_name})
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

delete('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

post('/volunteers') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  @volunteer = Volunteer.new({:first_name=>first_name, :last_name=>last_name})
  @volunteer.save()
  erb(:success)
end

get('/volunteers/:id') do
  @book = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

## Beginning of Project routing##
get('/projects/new') do
  erb(:project_form)
end

post('/projects') do
  name = params.fetch('name')
  new_project = Project.new({:id => nil, :name => name})
  new_project.save()
  @projects = Project.all()
  erb(:projects)
end


get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post('/project_volunteers') do
  name = params.fetch('name')
  project_id = params.fetch('project_id').to_i()
  new_volunteer = Volunteer.new({:id => nil, :name => name, :project_id => project_id})
  new_volunteer.save()
  @volunteers = Volunteer.all()
  @project = Project.find(project_id);
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch('id').to_i())
  erb(:project_edit_form)
end

patch('/projects/:id') do
  name = params.fetch('name')
  @project = Project.find(params.fetch('id').to_i())
  @project.update({:name => name})
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
