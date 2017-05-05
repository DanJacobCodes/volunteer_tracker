require('spec_helper')

describe(Project) do
  describe("#initialize") do
    it("is initialized with project_name and id") do
      project1 = Project.new({:project_name => project_name, :id => nil})
      expect(project1.project()).to(eq("Stuff"))
    end
  end

  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a project by its ID number") do
      project1 = Project.new({:project_name => project_name, :id => nil})
      project1.save()
      project2 = Project.new({:project_name => project_name, :id => nil})
      project2.save()
      expect(Project.find(project2.id())).to(eq(project2))
    end
  end

  describe("#==") do
    it("is the same project if it has the id, project and author") do
      project1 = Project.new({:project_name => project_name, :id => nil})
      project2 = Project.new({:project_name => project_name, :id => nil})
      expect(project1).to(eq(project2))
     end
   end

  describe("#update") do
    it("lets you update projects in the database") do
      project1 = Project.new({:project_name => project_name, :id => nil})
      project1.save()
      project1.update({:project_name => project_name, :id => nil})
      expect(project1.project_name()).to(eq("Stuff"))
    end
  end

  describe("#delete") do
    it("lets you delete a project from the database") do
      project1 = Project.new({:project_name => project_name, :id => nil})
      project1.save()
      project2 = Project.new({:project_name => project_name, :id => nil})
      project2.save()
      project2.delete()
      expect(Project.all()).to(eq([project1]))
    end
  end
end
