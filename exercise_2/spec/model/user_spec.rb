require_relative '../spec_helper.rb'

describe User do
  subject { user }

  describe "#new" do
    let(:user) { User.new({name: "bob"}) }

    its(:name) { should eq("bob") }
    its(:organization_roles) { should eq([]) }
  end

  describe "#add_organization_role" do
    let(:user) { User.new }
    before :each do
      @org1 = Organization.new({name: "First"})

      @org_role1 = OrganizationRole.new({organization: @org1, role: Role.admin})
      @org_role2 = OrganizationRole.new({organization: @org1, role: Role.admin})
      user.add_organization_role(@org_role1)
    end

    context "add a valid organization_role" do
      it "organization_roles should equal @org_role1" do
        user.organization_roles.should eq([@org_role1])
      end
    end

    context "try to add a invalid organization_role" do
      it "should raise error that Organization has already been added" do
        expect {user.add_organization_role(@org_role2)}.to raise_error
      end
    end
  end
end
