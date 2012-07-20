class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = EntriesController.alloc.init
    @window.makeKeyAndVisible
    RKLogInitialize()
    lcl_configure_by_name("RestKit/Network*", RKLogLevelTrace)
    lcl_configure_by_name("RestKit/ObjectMapping", RKLogLevelTrace)

    DCIntrospect.sharedIntrospector.start
    true
  end

end
