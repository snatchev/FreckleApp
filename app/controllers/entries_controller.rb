class EntriesController < UITableViewController

  attr_accessor :entries

  def entries
    @entries || []
  end

  def viewDidLoad
    Entry.all(self)
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
    cell.textLabel.text = entry.entryDescription
    cell.detailTextLabel.text = entry.createdAt
    cell
  end

  def objectLoader(loader, didLoadObjects:objects)
    @entries = objects
    self.tableView.reloadData
  end

  def objectLoader(loader, didFailWithError:error)
    puts error
  end
end
