# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap'
require 'bubble-wrap/reactor'

require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'FreckleApp'
  app.files += Dir['./vendor/teacup/lib/**/*.rb']
  app.files += Dir['./lib/**/*.rb']
  app.files += Dir['./app/**/*.rb']

  #this sticks the app files at the end (-_-)
  app.files = app.files.reverse.uniq.reverse.freeze

  app.pods do
    pod 'DCIntrospect'
    pod 'RestKit/Network'
    pod 'RestKit/UI'
    pod 'RestKit/ObjectMapping', git: 'https://github.com/appRenaissance/RestKit.git', commit: 'cc78e0a8d6bb59e1983b57b47590f5e4f381cd7c'
  end
end
