class OrganizationRole
  attr_accessor :organization, :role

  def initialize(args={})
    @organization = args.fetch(:organization, nil)
    raise "Organization is required." if @organization.nil?

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

  def ==(other_org_role)
    return organization == other_org_role.organization &&
              role == other_org_role.role
  end
end
