require_relative "../spec_helper"

describe Organization do
  describe "#new" do
    subject { org }

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
end
