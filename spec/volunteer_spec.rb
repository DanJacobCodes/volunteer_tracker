require('spec_helper')

describe(Volunteer) do
  describe("#initialize") do
    it("is initialized with volunteer attributes")
    volunteer1 = Volunteer.new({:first_name => "Dan", :last_name => "Jacob", :id => nil})
    expect(volunteer1.first_name()).to(eq("Dan"))
  end
end
