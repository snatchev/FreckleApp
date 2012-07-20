class Project
  extend RestModel
  mapping(rootKey:"project", resourcePath:"/projects.json") do
    {
      remainingMinutes: "remaining_minutes",
      name: "name",
      unbillableMinutes: "unbillable_minutes",
      budgetMinutes: "budget_minutes",
      createdAt: "created_at",
      billable: "billable",
      minutes: "minutes",
      cachedTags: "cached_tags",
      updatedAt: "updated_at",
      importId: "import_id",
      accountId: "account_id",
      projectGroupId: "project_group_id",
      projectId: "id",
      enabled: "enabled",
      groupName: "group_name",
      userId: "user_id",
      colorHex: "color_hex",
      budget: "budget",
      stepping: "stepping",
      invoiceRecipientDetails: "invoice_recipient_details"
    }
  end
  def self.all(delegate)
    RKObjectManager.sharedManager.loadObjectsAtResourcePath("/projects.json", delegate:delegate)
  end
end
