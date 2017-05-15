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
  @projects = Project.all()
  erb(:volunteers_form)
end

post('/volunteers') do
  name = params.fetch('name')
  project_id = params.fetch('project_id')
  new_volunteer = Volunteer.new({:id => nil, :name => name, :project_id => project_id})
  new_volunteer.save()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  erb(:volunteer)
end

get('/volunteers/:id/edit') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @projects = Project.all()
  erb(:edit_volunteer)
end

patch('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  project_id = params.fetch('project_id').to_i()
  @volunteer.update({:project_id => project_id})
  erb(:volunteer)
end
delete('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/projects/new')do
  erb(:project_form)
end

post('/projects')do
  name = params.fetch('name')
  new_project = Project.new({:id => nil, :name => name})
  new_project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects')do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id')do
  @project = Project.find(params.fetch('id').to_i())
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
  erb(:edit_project)
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

post('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
