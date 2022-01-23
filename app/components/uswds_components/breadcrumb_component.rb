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

      def current?
        return false if href.blank?

        current_page? href
      end

      def linked?
        return false if href.blank?

        !current?
      end
    end
  end
end
