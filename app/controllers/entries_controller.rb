class EntriesController < UITableViewController

  attr_accessor :entries

  def entries
    @entries || []
  end

  def viewDidLoad
    Entry.in_week(2) do |entries, loader, error|
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
end
