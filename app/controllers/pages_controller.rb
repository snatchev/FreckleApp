class PagesController < UIViewController

  attr_accessor :page_controller
  attr_accessor :entries_controller
  attr_accessor :current_week_number

  stylesheet :pages

  layout :root do
    @toolbar = UIToolbar.alloc.init
    @toolbar_items = [UIBarButtonItem.alloc.initWithTitle("One", style:UIBarButtonItemStyleBordered, target:self, action:"test")]
    @title_button = UIBarButtonItem.alloc.initWithTitle("Week 5", style:UIBarButtonItemStylePlain, target:self, action:"handleTitleTap")
    @toolbar_items << @title_button
    @toolbar.setItems(@toolbar_items, animated:false)
    @toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);

    subview(@toolbar)
  end

  def viewDidLoad
    super
    self.page_controller = UIPageViewController.alloc.initWithTransitionStyle(UIPageViewControllerTransitionStylePageCurl, navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal, options:nil)
    page_controller.dataSource = self
    page_controller.delegate = self
    page_controller.doubleSided = false

    self.entries_controller = EntriesController.alloc.init
    self.current_week_number = 5
    entries_controller.week_number = 5

    page_controller.setViewControllers([entries_controller], direction:UIPageViewControllerNavigationDirectionForward, animated:false, completion:nil)

    #add page controller
    self.addChildViewController(page_controller)
    self.view.addSubview(page_controller.view)
    page_controller.didMoveToParentViewController(self)

    #Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    #page_controller.view.frame = self.view.bounds
    page_controller.view.frame = CGRectMake(0,44,320, App.frame.size.height - 44)

    # Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = page_controller.gestureRecognizers
  end

  def test
    puts 'clicked'
  end

  ##
  # data source methods
  #
  def pageViewController(pageViewController, viewControllerBeforeViewController:viewController)
    puts 'previous'
    self.current_week_number -= 1
    @title_button.title = "Week #{current_week_number}"
    self.entries_controller = EntriesController.alloc.init
    entries_controller.week_number = current_week_number
    entries_controller
  end
  def pageViewController(pageViewController, viewControllerAfterViewController:viewController)
    puts 'next'
    self.current_week_number += 1
    @title_button.title = "Week #{current_week_number}"
    self.entries_controller = EntriesController.alloc.init
    entries_controller.week_number = current_week_number
    entries_controller
  end

  #delegate methods
  #/*
  #- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
  #{
  #}
  # */
  #- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
  #{
  #  // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
  #  UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
  #  NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
  #  [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];

  #  self.pageViewController.doubleSided = NO;
  #  return UIPageViewControllerSpineLocationMin;
  #}
  def pageViewController(pageViewController, spineLocationForInterfaceOrientation:orientation)
    self.page_controller.setViewControllers([entries_controller], direction:UIPageViewControllerNavigationDirectionForward, animated:true, completion:nil)
    UIPageViewControllerSpineLocationMin
  end
end
