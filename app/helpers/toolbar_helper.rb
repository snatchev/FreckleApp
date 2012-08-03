module ToolbarHelper
  module_function
  def flexible
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace,target:nil,action:nil)
  end
end
