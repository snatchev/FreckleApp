class EntriesController < UITableViewController

  attr_accessor :entries

  def entries
    @entries || []
  end

  def viewDidLoad
    User.all(self)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    entries.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier "Entry"
    cell = nil
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:"Entry")
    end
    cell.textLabel.text = entries[indexPath.row].firstName
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
