class UserOrganizationRole
  attr_accessor :user, :organization, :role

  def initialize(args={})
    @user = args.fetch(:user, nil)
    @organization = args.fetch(:organization, nil)
    @role = args.fetch(:role, Role.denied)
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
