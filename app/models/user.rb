class User
  extend RestModel
  mapping(rootKey:"user", resourcePath:"/users.json") do
    {
      userId: "id",
      email: "email",
      firstName: "first_name",
      lastName: "last_name",
      login: "login",
      permissions: "permissions",
      time_format: "time_format",
      week_start: "week_start"
    }
  end

  def self.all(delegate)
    RKObjectManager.sharedManager.loadObjectsAtResourcePath("/users.json", delegate:delegate)
  end
end
