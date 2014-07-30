class Organization
  attr_accessor :name, :children, :parent

  @@orgs = 0
  @@child_orgs = 0

  def initialize(args={})
    @children = args.fetch(:children, [])
    @parent = args.fetch(:parent, nil)
    @name = args.fetch(:name, default_name)
  end

  def add_child(args={})
    children << child = Organization.new(args.merge({parent: self}))
    child
  end

  def root_org?
    parent.nil?
  end

  private

  def default_name
    root_org? ? "Root Org":(parent.root_org? ? "Org #{@@orgs+=1}":"Child Org #{@@child_orgs+=1}")
  end
end
