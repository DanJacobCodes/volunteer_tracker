require('spec_helper')

describe(Volunteer) do
  describe("#initialize") do
    it("is initialized with volunteer attributes") do
    volunteer1 =  Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => 1, :id => nil})
    expect(volunteer1.first_name()).to(eq("Dan"))
  end
end

describe(".all") do
  it("starts off with no volunteers") do
  expect(Volunteer.all()).to(eq([]))
  end
end

describe(".find") do
  it("returns a volunteer by its ID") do
    test_volunteer =  Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
    test_volunteer.save()
    expect(Volunteer.find(test_volunteer1.id)).to(eq(test_volunteer1))
  end
end

 describe("#==") do
    it("is the same volunteer if it has the same first name, last name and id") do
    volunteer1 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
    volunteer2 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
    expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe("#update") do
    it("lets you update volunteers in the database") do
      volunteer1 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
      volunteer1.save()
      volunteer1 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
      expect(volunteer1.first_name()).to(eq("Dan"))
    end
  end

  describe("#delete") do
    it("lets you remove a volunteer from the database") do
      volunteer1 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :project_id => nil, :id => nil})
      volunteer2 = Volunteer.new({:first_name => "Kobe", :last_name => "Bryant", :project_id => nil, :id => nil})
      volunteer1.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
