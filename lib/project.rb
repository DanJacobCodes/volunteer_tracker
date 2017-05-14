class Project
  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    projects_in_database = DB.exec("SELECT * FROM projects;")
    all_projects = []
    projects_in_database.each() do |project|
      name = project.fetch('name')
      id = project.fetch('id').to_i()
      each_project = Project.new({:name => name, :id => id})
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
    end
    found_project
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_project)
    (self.name() == another_project.name()) && (self.id() == another_project.id())
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{@id};")
    end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id()};")
  end

  def volunteers
  volunteers_in_project = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
   project_volunteers = []
   volunteers_in_project.each() do |volunteer|
   id = volunteer.fetch('id').to_i()
   name = volunteer.fetch('name')
   project_id = self.id().to_i()
   project_volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
 end
 project_volunteers
  end
end
