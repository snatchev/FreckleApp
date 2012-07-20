class RestModel
  RKObjectManager.managerWithBaseURLString("https://appren.letsfreckle.com/api")

  def self.mapping(opts = {}, &block)
    objectMapping = RKObjectMapping.mappingForClass(self)
    map = block.call
    map.each do |key, value|
      attr_accessor(key)
      objectMapping.mapKeyPath(value, toAttribute:key.to_s)
    end
    RKObjectManager.sharedManager.mappingProvider.setObjectMapping(objectMapping, forResourcePathPattern: opts[:resourcePath])
    RKObjectManager.sharedManager.mappingProvider.registerObjectMapping(objectMapping, withRootKeyPath:opts[:rootKey])
    RKObjectManager.sharedManager.client.setValue("1opmx4g9v944psyjfq35985jcs94au1", forHTTPHeaderField:"X-FreckleToken")
  end
end
