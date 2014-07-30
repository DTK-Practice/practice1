class User
  attr_accessor :role, :name, :organization

  def initialize(args={})
    @role = args.fetch(:role, Role.denied)
    @name = args.fetch(:name, nil)
    @organization = args.fetch(:organization, nil)
  end

  def admin?
    role == Role.admin
  end

  def user?
    role == Role.user
  end

  def denied?
    role == Role.denied
  end
end
