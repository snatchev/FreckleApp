class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = EntriesController.alloc.init
    @window.makeKeyAndVisible
    DCIntrospect.sharedIntrospector.start
    true
  end

end
