class Organization
  attr_accessor :name, :children, :parent

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
    !has_parent?
  end

  private

  def has_parent?
    !parent.nil?
  end

  def default_name
    "Root Org"
  end
end
