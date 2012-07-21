class Entry
  extend RestModel
  mapping(rootKey:"entry", resourcePath:"/entries.json") do
    {
      createdAt: "created_at",
      billable: "billable",
      minutes: "minutes",
      updatedAt: "updated_at",
      recentlyUpdatedAt: "recently_updated_at",
      projectId: "project_id",
      importId: "import_id",
      url: "url",
      timeTo: "time_to",
      entryId: "id",
      date: "date",
      userId: "user_id",
      formattedDescription: "formatted_description",
      descriptionText: "description_text",
      timeFrom: "time_from",
      entryDescription: "description",
      invoicedAt: "invoiced_at",
      projectInvoiceId: "project_invoice_id"
    }
      #"tags": [
        #{
          #"name": "bulk import",
          #"billable": true,
          #"id": 23035
        #}
      #],
  end
  def self.all(delegate)
    RKObjectManager.sharedManager.loadObjectsAtResourcePath("/entries.json", delegate:delegate)
  end
end
