class EntriesController < UITableViewController

  attr_accessor :entries
  attr_accessor :week_number


  def entries
    @entries || []
  end

  def week_number
    @week_number || 5
  end

  def week_number=(value)
    @week_number = value
    reload_data
  end

  def reload_data
    Entry.in_week(week_number) do |entries, loader, error|
      if error.nil?
        self.entries = entries
        self.tableView.reloadData
      end
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    entries.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    entry = entries[indexPath.row]
    cell = tableView.dequeueReusableCellWithIdentifier "Entry"
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:"Entry")
    end
    cell.textLabel.text = entry.entry_description
    cell.detailTextLabel.text = entry.created_at
    cell
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    autorotateToOrientation(orientation)
  end
end
