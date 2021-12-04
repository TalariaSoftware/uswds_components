module UswdsComponents
  class BreadcrumbComponent < ViewComponent::Base
    attr_accessor :wrap

    renders_many :crumbs, 'Crumb'

    def initialize(wrap: false)
      super()
      @wrap = wrap
    end

    class Crumb < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href:, name:)
        super
        @href = href
        @name = name
      end
    end
  end
end
