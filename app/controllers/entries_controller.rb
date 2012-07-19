class EntriesController < UITableViewController

  attr_accessor :entries

  def entries
    @entries || []
  end

  def viewDidLoad
    FreckleApi.getProjects do |json|
      @entries = json
      self.tableView.reloadData
    end
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
    cell.textLabel.text = entries[indexPath.row]["project"]["name"]
    cell
  end
end
