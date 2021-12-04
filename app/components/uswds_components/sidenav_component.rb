module UswdsComponents
  class SidenavComponent < ViewComponent::Base
    class Item < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href:, name:)
        super
        @href = href
        @name = name
      end
    end
  end
end
