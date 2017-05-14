require('spec_helper')

describe(Volunteer) do
  describe("#initialize") do
    it("is initialized with volunteer attributes") do
    volunteer1 =  Volunteer.new({:name => "Dan", :project_id => 1, :id => nil})
    expect(volunteer1.name()).to(eq("Dan"))
  end
end

describe(".all") do
  it("starts off with no volunteers") do
   expect(Volunteer.all()).to(eq([]))
  end
end

describe("#save") do
  it("saves the volunteer in the volunteers array") do
    volunteer1 = Volunteer.new({:id => nil, :name => "Dan", :project_id => 1 })
    volunteer1.save()
    volunteer2 = Volunteer.new({:id => nil, :name => "Jacob", :project_id => 2 })
    volunteer2.save()
    expect(Volunteer.all).to(eq([volunteer1, volunteer2]))
  end
end

describe('.find') do
   it('finds the volunteer based on id') do
     test_volunteer = Volunteer.new({:id=> nil, :name => "Dan", :project_id => 1})
     test_volunteer.save();
     expect(Volunteer.find(test_volunteer.id())).to(eq(test_volunteer))
   end
 end

 describe("#==") do
    it("is the same volunteer if it has the same first name, last name and id") do
    volunteer1 = Volunteer.new({:name => "Dan", :project_id => 1, :id => nil})
    volunteer2 = Volunteer.new({:name => "Dan", :project_id => 1, :id => nil})
    expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe("#update") do
    it("lets you update volunteers in the database") do
      volunteer1 = Volunteer.new({:name => "Dan", :project_id => nil, :id => nil})
      volunteer1 = Volunteer.new({:name => "Dan", :project_id => nil, :id => nil})
      expect(volunteer1.name()).to(eq("Dan"))
    end
  end

  describe("#delete") do
    it("lets you remove a volunteer from the database") do
      volunteer1 = Volunteer.new({:name => "Dan", :project_id => 1, :id => nil})
      volunteer1.save()
      volunteer1.delete()
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
