module UswdsComponents
  class PaginationComponent < ViewComponent::Base
    class Page < ViewComponent::Base
      attr_accessor :url, :index, :current, :last

      def initialize(url:, index:, current: false, last: false)
        super
        @url = url
        @index = index
        @current = current
        @last = last
      end

      def aria_label
        if last
          "Last page, page #{index}"
        else
          "Page #{index}"
        end
      end
    end

    class Previous < ViewComponent::Base
      attr_accessor :url

      def initialize(url:)
        super
        @url = url
      end
    end

    class Next < ViewComponent::Base
      attr_accessor :url

      def initialize(url:)
        super
        @url = url
      end
    end

    class Overflow < ViewComponent::Base
    end
  end
end
