require_relative "../spec_helper"

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
      let(:org) do
        Organization.new({name: "First", parent: "Parent", children: [1,2,3] })
      end

      its(:children) { should eq([1,2,3]) }
      its(:parent) { should eq("Parent")  }
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
      let(:org) { Organization.new({parent: 1}) }

      its(:root_org?) { should be false }
    end
  end
end
