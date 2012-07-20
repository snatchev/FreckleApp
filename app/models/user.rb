class User < RestModel
  mapping {
    userId: "id",
    email: "email",
    firstName: "first_name",
    lastName: "last_name"
    login: "login"
  }
end
