class Project

  attr_accessor(:projects, :id)

def initialize(attributes)
  @projects = attributes.fetch(:projects)
  @id = attributes.fetch(:id)
end

def self.all
  projects_in_database = DB.exec("SELECT * FROM projects;")
  all_projects = []
    projects_in_database.each() do |project|
      projects = project.fetch('project')
      id = project.fetch('id').to_i()
      each_project = Project.new({:projects => projects, :id => id})
      all_projects.push(each_project)
    end
    all_projects
  end

  def save
    result = DB.exec("INSERT INTO projects (projects) VALUES ('#{@projects}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end



  def ==(another_project)
    (self.projects() == another_project.projects())


  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    end
    found_project
  end
end
end
