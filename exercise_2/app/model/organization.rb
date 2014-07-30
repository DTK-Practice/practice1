class Organization
  attr_accessor :name, :children, :parent

  def initialize(args={})
    @children = args.fetch(:children, [])
    @parent = args.fetch(:parent, nil)
    @name = args.fetch(:name, default_name)
  end

  private

  def default_name
    "Root Org"
  end
end
