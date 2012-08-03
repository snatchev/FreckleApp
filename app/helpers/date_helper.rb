module DateHelper
  module_function
  #
  #TODO: move this into a helper
  def date_strings_from_week_number(week_number)
    today = NSDate.date
    calendar = NSCalendar.alloc.initWithCalendarIdentifier(NSGregorianCalendar)
    components = NSDateComponents.alloc.init
    components.year = 2012
    #move to the week #
    components.weekOfYear = week_number
    components.weekday = 2 #monday
    startDate = calendar.dateFromComponents(components)
    components.weekday = 7 #saturday
    endDate = calendar.dateFromComponents(components)

    formatter = NSDateFormatter.alloc.init
    formatter.dateFormat = "yyyy-MM-dd"
    startDateStr = formatter.stringFromDate(startDate)
    endDateStr = formatter.stringFromDate(endDate)
    [startDateStr, endDateStr]
  end
end
