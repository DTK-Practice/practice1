require_relative '../spec_helper.rb'

describe Role do
  subject { role }
  describe "role" do
    let(:role) { Role }

    its(:admin) { should eq("Admin") }
    its(:user) { should eq("User") }
    its(:denied) { should eq("Denied") }
  end
end
