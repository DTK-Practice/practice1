class User
  attr_accessor :name, :organization_roles

  def initialize(args={})
    @name = args.fetch(:name, nil)
    @organization_roles = args.fetch(:organization_roles, [])
  end

  def add_organization_role(organization_role)
    raise "This Organization Role already is added" if organization_role_already_exists(organization_role)
    @organization_roles << organization_role unless organization_role.nil?
  end

  private

  def organization_role_already_exists(organization_role)
    return false if organization_roles.empty?
    organization_roles.each{|org_role| org_role == organization_role }
  end
end
