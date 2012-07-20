# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'FreckleApp'
  app.files.unshift(*Dir['vendor/teacup/lib/**/*.rb'])

  app.pods do
    pod 'DCIntrospect'
    pod 'RestKit/Network'
    pod 'RestKit/UI'
    pod 'RestKit/ObjectMapping'
  end
end
