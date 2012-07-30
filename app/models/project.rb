class Project
  include RestKit::Document
  include RestKit::Delegate

  restkit do
    root_key "project"
    resource_path "projects.json"

    field :remaining_minutes
    field :name
    field :unbillable_minutes
    field :budget_minutes
    field :created_at
    field :billable
    field :minutes
    field :cached_tags
    field :updated_at
    field :import_id
    field :account_id
    field :project_group_id
    field :id, as: 'project_id'
    field :enabled
    field :group_name
    field :user_id
    field :color_hex
    field :budget
    field :stepping
  end
end
