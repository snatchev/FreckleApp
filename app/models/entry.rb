class Entry
  include RestKit::Document
  include RestKit::Delegate
  restkit do
    root_key "entry"
    resource_path "/entries.json"

    field :created_at
    field :billable
    field :minutes
    field :updated_at
    field :recently_updated_at
    field :project_id
    field :import_id
    field :url
    field :id, as: 'entry_id'
    field :time_to
    field :user_id
    field :formatted_description
    field :description_text
    field :time_from
    field :description, as: 'entry_description'
    field :invoiced_at
    field :project_invoice_id

    #embeds_many :tags
  end
      ##"tags": [
        ##{
          ##"name": "bulk import",
          ##"billable": true,
          ##"id": 23035
        ##}
      ##],
  #end

  def self.in_week(week_number, &block)
    start_date, end_date = DateHelper.date_strings_from_week_number(week_number)
    query = {
      search: {from: start_date, to: end_date}
    }

    self.load_objects(query, &block)
  end
end
