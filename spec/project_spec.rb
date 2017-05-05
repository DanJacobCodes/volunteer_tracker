require('spec_helper')

describe(Project) do
  describe("#initialize") do
    it("is initialized with a projects attributes") do
      project1 = Project.new({:projects => "Disaster Relief", :id => nil})
      expect(project1.projects()).to(eq("Disaster Relief"))
    end
  end

  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end
  describe(".find") do
    it("returns a project by its ID number") do
      project1 = Project.new({:projects => "Disaster Relief", :id => nil})
      project1.save()
      project2 = Project.new({:projects => "Food Bank", :id => nil})
      project2.save()
      expect(Project.find(project2.id())).to(eq(project2))
    end
  end

  describe("#save") do
    it("adds a project to the array of saved projects") do
      test_project = Project.new({:projects => "Disaster Relief", :id => nil})
      test_project.save()
      expect(Project.all()).to(eq([test_project]))
    end
  end


  describe("#==") do
    it("is the same project if it has the id, projects and author") do
      project1 = Project.new({:projects => "Disaster Relief", :id => nil})
      project2 = Project.new({:projects => "Food Bank", :id => nil})
      expect(project1).to(eq(project2))
     end
   end
 end
