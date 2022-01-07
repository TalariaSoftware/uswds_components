module UswdsComponents
  class SidenavComponent < ViewComponent::Base
    renders_many :items, 'Item'

    class Item < ViewComponent::Base
      attr_accessor :href, :name

      renders_many :items, Item

      def initialize(href:, name:)
        super
        @href = href
        @name = name
      end
    end
  end
end
