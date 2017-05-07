class Volunteer
  attr_accessor(:first_name, :last_name, :project_id, :id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def self.all
    volunteers_in_database = DB.exec("SELECT * FROM volunteers;")
    all_volunteers = []
    volunteers_in_database.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      project_id = volunteer.fetch('project_id').to_i()
      id = volunteer.fetch('id').to_i()
      each_volunteer = Volunteer.new({:id => id, :first_name => first_name, :last_name => last_name, :project_id => project_id})
      all_volunteers.push(each_volunteer)
    end
    all_volunteers
  end

  def save
      result = DB.exec("INSERT INTO volunteers (first_name, last_name, project_id) VALUES ('#{@first_name}', '#{@last_name}', #{@project_id}) RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

  def ==(another_volunteer)
    (self.first_name() == another_volunteer.first_name()) && (self.id() == another_volunteer.id()) && (self.last_name() == another_volunteer.last_name()) && (self.project_id == another_volunteer.project_id())
  end


  def self.find(id)
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id() == (id)
        found_volunteer = volunteer
      end
    found_volunteer
  end

  def update(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @project_id = attributes.fetch(:project_id)
    @id = self.id()
    DB.exec("UPDATE volunteers SET first_name = '#{@first_name}', last_name = '#{@last_name}', project_id = #{@project_id},  WHERE id = #{@id};")
  end

  def delete
   DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
   end

  def project
    project_id = self.project_id
    result = DB.exec("SELECT * FROM projects WHERE id = #{project_id};")
    name = result.first().fetch('name')
     end
   end
 end
