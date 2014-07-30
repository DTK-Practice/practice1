require_relative "../spec_helper"

#Unit Test
describe Organization do
  subject { org }

  describe "#new" do
    context "default values" do
      let(:org) { Organization.new }

      its(:children) { should eq([]) }
      its(:parent) { should == nil }
      its(:name) { should eq("Root Org") }
    end

    context "set values" do
      before :all do
        @parent_org = Organization.new
      end

      let(:org) do
        Organization.new({name: "First", parent: @parent_org, children: [1,2,3] })
      end

      its(:children) { should eq([1,2,3]) }
      its(:parent) { should eq(@parent_org)  }
      its(:name) { should eq("First") }
    end
  end

  describe "#add_child" do
    let(:org) { Organization.new }

    before :each do
      @child1 = org.add_child
      @child2 = org.add_child
    end

    its(:children) { should eq([@child1, @child2]) }

    it("the children should have a parent equal to org") do
      @child1.parent.should eq(org)
    end
  end

  describe "#root_org?" do
    context "is root org" do
      let(:org) { Organization.new }

      its(:root_org?) { should be true }
    end

    context "is not root org" do
      let(:org) { Organization.new({parent: Organization.new}) }

      its(:root_org?) { should be false }
    end
  end
end

#Functional Test
describe Organization do
  before :all do
    @root = create_orgs
  end

  it "there is a Root Org" do
    @root.root_org?.should be true
  end

  it "has 3 Orgs" do
    @root.children.size.should eq(3)
  end

  it "each Org has 3 Child Orgs" do
    @root.children.each{|org| org.children.size.should eq(3)}
  end
end
