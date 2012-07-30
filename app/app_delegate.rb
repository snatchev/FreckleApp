class AppDelegate
  RestKit.base_url = "https://apitest.letsfreckle.com/api"

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = EntriesController.alloc.init
    @window.makeKeyAndVisible
    #RKLogInitialize()
    #lcl_configure_by_name("RestKit/Network*", RKLogLevelTrace)
    #lcl_configure_by_name("RestKit/ObjectMapping", RKLogLevelTrace)

    RestKit.manager.client.setValue("lx3gi6pxdjtjn57afp8c2bv1me7g89j", forHTTPHeaderField:"X-FreckleToken")
    DCIntrospect.sharedIntrospector.start
    true
  end

end
