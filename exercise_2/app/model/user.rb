class User
  attr_accessor :name

  def initialize(args={})
    @name = args.fetch(:name, nil)
  end
end
