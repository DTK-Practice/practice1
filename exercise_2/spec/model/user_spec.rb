require_relative '../spec_helper.rb'

describe User do
  subject { user }
  describe "#admin?" do
    context "is admin" do
      let(:user) { User.new({role: Role.admin}) }
      its(:admin?) { should be true }
    end

    context "not admin" do
      let(:user) { User.new({role: Role.denied}) }
      its(:admin?) { should be false }
    end
  end

  describe "#user?" do
    context "is user" do
      let(:user) { User.new({role: Role.user}) }
      its(:user?) { should be true }
    end

    context "not user" do
      let(:user) { User.new({role: Role.denied}) }
      its(:user?) { should be false }
    end
  end

  describe "#denied?" do
    context "is denied" do
      let(:user) { User.new({role: Role.denied}) }
      its(:denied?) { should be true }
    end

    context "not denied" do
      let(:user) { User.new({role: Role.admin}) }
      its(:denied?) { should be false }
    end
  end
end
