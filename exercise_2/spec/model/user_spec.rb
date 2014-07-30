require_relative '../spec_helper.rb'

describe User do
  subject { user }

  describe "#new" do
    let(:user) { User.new({name: "bob"}) }

    its(:name) { should eq("bob") }
  end
end
