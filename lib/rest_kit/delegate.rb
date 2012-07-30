module RestKit
  module Delegate
    def self.included(base)
      base.extend ClassMethods
    end

    class DefferedDelegate
      include ::BubbleWrap::Reactor::Deferrable
      def initialize(&block)
        self.callback(&block)
        self.errback(&block)
        self
      end

      def objectLoader(loader, didLoadObjects:objects)
        succeed(objects, loader, nil)
      end

      def objectLoader(loader, didFailWithError:error)
        fail([], loader, error)
      end
    end

    module ClassMethods
      def all(&block)
        #HACK: delegates are weak references, we are putting this in an instance variable so it doesnt get GC'ed
        #probably bad practice.
        @delegate = DefferedDelegate.new(&block)
        RKObjectManager.sharedManager.loadObjectsAtResourcePath("/users.json", delegate:@delegate)
      end
    end
  end
end
