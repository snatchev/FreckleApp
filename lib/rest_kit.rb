module RestKit
  module_function
  def base_url=(value)
    RKObjectManager.managerWithBaseURLString(value)
  end

  def manager
    RKObjectManager.sharedManager
  end
end
