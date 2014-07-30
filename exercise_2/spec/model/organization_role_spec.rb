require_relative '../spec_helper.rb'

describe OrganizationRole do
  subject(:org_role) { OrganizationRole.new({organization: Organization.new}) }

  describe "#admin?" do
    context "is admin" do
      before :each do org_role.role = Role.admin end
      its(:admin?) { should be true }
    end

    context "not admin" do
      before :each do org_role.role = Role.denied end
      its(:admin?) { should be false }
    end
  end

  describe "#user?" do
    context "is user" do
      before :each do org_role.role = Role.user end
      its(:user?) { should be true }
    end

    context "not user" do
      before :each do org_role.role = Role.denied end
      its(:user?) { should be false }
    end
  end

  describe "#denied?" do
    context "is denied" do
      before :each do org_role.role = Role.denied end
      its(:denied?) { should be true }
    end

    context "not denied" do
      before :each do org_role.role = Role.admin end
      its(:denied?) { should be false }
    end
  end

  describe "#==" do
    before :each do
      @org1 = Organization.new({name: "First"})
      @org2 = Organization.new({name: "Second"})

      @org_role1 = OrganizationRole.new({organization: @org1, role: Role.admin})
      @org_role2 = OrganizationRole.new({organization: @org2, role: Role.admin})
      @org_role3 = OrganizationRole.new({organization: @org1, role: Role.denied})
      @org_role4 = OrganizationRole.new({organization: @org2, role: Role.denied})
      @org_role5 = OrganizationRole.new({organization: @org1, role: Role.admin})
    end

    it "org_role1 should not equal org_role2" do
      @org_role1.should_not == @org_role2
    end

    it "org_role1 should not equal org_role3" do
      @org_role1.should_not == @org_role3
    end

    it "org_role1 should not equal org_role4" do
      @org_role1.should_not == @org_role4
    end

    it "org_role1 should equal org_role5" do
      @org_role1.should == @org_role5
    end
  end
end
