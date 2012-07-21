module RestModel
  RKObjectManager.managerWithBaseURLString("https://apitest.letsfreckle.com/api")

  def mapping(opts = {}, &block)
    objectMapping = RKObjectMapping.mappingForClass(self)
    map = block.call
    map.each do |key, value|
      attr_accessor(key)
      objectMapping.mapKeyPath(value, toAttribute:key.to_s)
    end
    RKObjectManager.sharedManager.mappingProvider.setObjectMapping(objectMapping, forResourcePathPattern: opts[:resourcePath])
    RKObjectManager.sharedManager.mappingProvider.registerObjectMapping(objectMapping, withRootKeyPath:opts[:rootKey])
    RKObjectManager.sharedManager.client.setValue("lx3gi6pxdjtjn57afp8c2bv1me7g89j", forHTTPHeaderField:"X-FreckleToken")
  end
end
