class Project
  attr_accessor(:project_name, :id)

  def initialize(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = attributes.fetch(:id)
  end

  def self.all
    projects_in_database = DB.exec("SELECT * FROM projects;")
    all_projects = []
    projects_in_database.each() do |project|
      name = project.fetch('project_name')
      id = project.fetch('id').to_i()
      each_project = Patron.new({:project_name => project_name, :id => id})
      all_projects.push(each_project)
    end
    all_projects
  end

  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    found_project
  end

  def save
    result = DB.exec("INSERT INTO projects (projects_name) VALUES ('#{@project_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_project)
    (self.project_name() == another_project.project_name()) && (self.id() == another_project.id())
  end


  def update(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = self.id()
    DB.exec("UPDATE projects SET project_name = '#{@project_name}' WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM patrons WHERE id = #{self.id};")
  end
end
