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
end
