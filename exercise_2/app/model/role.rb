class Role
  @admin = "Admin"
  @user = "User"
  @denied = "Denied"

  class << self
    attr_reader :admin, :user, :denied
  end
end
