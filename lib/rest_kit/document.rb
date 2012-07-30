module RestKit
  module Document
    def self.included(base)
      base.extend ClassMethods
      base.fields = []
      base.manager = RKObjectManager.managerWithBaseURLString("https://appren.letsfreckle.com/api")
      base.mapping = RKObjectMapping.mappingForClass(base)
    end

    module ClassMethods
      attr_accessor :fields
      attr_accessor :manager
      attr_accessor :mapping

      def restkit(&block)
        block.call
        RKObjectManager.sharedManager.mappingProvider.setObjectMapping(mapping, forResourcePathPattern:resource_path)
        RKObjectManager.sharedManager.mappingProvider.registerObjectMapping(mapping, withRootKeyPath:root_key)

        #move this outta here
        RKObjectManager.sharedManager.client.setValue("ij5lwdth1vvbdv1govzfk5umxs5lmoe", forHTTPHeaderField:"X-FreckleToken")
      end

      def root_key(value = nil)
        return @root_key = value if value
        @root_key
      end

      def resource_path(value = nil)
        return @resource_path = value if value
        @resource_path
      end

      def field(property, opts = {})
        #property is on the js object
        property = property.to_s
        #attribute is on the rb object
        attribute = opts[:as] || property.camelize
        attr_accessor(attribute)
        mapping.mapKeyPath(property, toAttribute:attribute)
      end

=begin
      def embeds_many
      end

      def embeds_one
      end

      def embedded_in
      end

      def has_one
      end

      def has_many
      end

      def has_and_belongs_to_many
      end

      def belongs_to
      end
=end
    end
  end
end
