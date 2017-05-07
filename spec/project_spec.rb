require('spec_helper')

describe(Project) do
  describe("#initialize") do
    it("is initialized with name and id") do
      project1 = Project.new({:name => "Stuff", :id => nil})
      expect(project1.name()).to(eq("Stuff"))
    end
  end

  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a project by its ID number") do
      project1 = Project.new({:name => "Stuff", :id => nil})
      project1.save()
      expect(Project.find(project1.id)).to(eq(project1))
    end
  end

  describe("#save") do
    it("saves a project to the database") do
      projects = Project.new({:name => "Stuff", :id => nil})
      projects.save()
      expect(Project.all()).to(eq([projects]))
    end
  end

  describe("#==") do
    it("is the same project if it has the id, project") do
      project1 = Project.new({:name => "Stuff", :id => nil})
      project2 = Project.new({:name => "Stuff", :id => nil})
      expect(project1).to(eq(project2))
     end
   end

  describe("#update") do
    it("lets you update projects in the database") do
      project1 = Project.new({:name => "Stuff", :id => nil})
      project1.save()
      project1.update({:name => "Stuff", :id => nil})
      expect(project1.name()).to(eq("Stuff"))
    end
  end

  describe("#delete") do
    it("lets you delete a project from the database") do
      project1 = Project.new({:name => "Stuff", :id => nil})
      project1.save()
      project2 = Project.new({:name => "Stuff", :id => nil})
      project2.save()
      project2.delete()
      expect(Project.all()).to(eq([project1]))
    end
  end
end
