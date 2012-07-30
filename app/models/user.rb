class User
  include RestKit::Document
  include RestKit::Delegate
  restkit do
    root_key "user"
    resource_path "/users.json"

    field :id, as: "user_id"
    field :email
    field :first_name
    field :last_name
    field :login
  end

  ##
  # User.all do |users, loader, error|
  #   if loader.succeeded?
  #     @entries = users
  #     tableView.reloadData
  #   else
  #     App.alert(error)
  #   end
  # end
end
