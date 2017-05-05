class Book
  attr_accessor(:first_name, :last_name, :id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @id = attributes.fetch(:id)
  end

  def self.all
    volunteers_in_database = DB.exec("SELECT * FROM volunteers;")
    all_volunteers = []
    volunteers_in_database.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      id = volunteer.fetch('id').to_i()
      each_volunteer = Book.new({:first_name => first_name, :last_name => last_name, :id => id})
      all_volunteers.push(each_volunteer)
    end
    all_volunteers
  end

  def fullname
    'Title: ' + @first_name + ' Author: ' + @last_name
  end

  def save
    result = DB.exec("INSERT INTO volunteers (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end



  def ==(another_volunteer)
    (self.first_name() == another_volunteer.first_name()) && (self.id() == another_volunteer.id()) && (self.last_name() == another_volunteer.last_name())
  end


  def self.find(id)
    found_volunteer = nil
    Book.all().each() do |volunteer|
      if volunteer.id() == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  def update(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @id = self.id()
    DB.exec("UPDATE volunteers SET first_name = '#{@first_name}', last_name = '#{@last_name}' WHERE id = #{@id};")
  end

  def delete
   DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
 end

  def self.search(keyword)
    search_volunteers = DB.exec("SELECT * FROM volunteers WHERE first_name = '#{keyword}' OR last_name = '#{keyword}'")
    found_volunteers = []
    search_volunteers.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      id = volunteer.fetch('id').to_i()
      each_volunteer = Book.new({:id => id, :first_name => first_name, :last_name => last_name})
      found_volunteers.push(each_volunteer)
    end
    found_volunteers
  end

end
