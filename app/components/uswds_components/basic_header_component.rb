module UswdsComponents
  class BasicHeaderComponent < ViewComponent::Base
    attr_accessor :image_path

    renders_one :logo, 'BasicLogo'
    renders_many :primary_items, 'PrimaryItem'

    def initialize(image_path: '/assets/img')
      super
      @image_path = image_path
    end

    def close_image
      "#{image_path}/usa-icons/close.svg"
    end

    class BasicLogo < ViewComponent::Base
      attr_accessor :title, :href

      def initialize(title: '', href: '/')
        super
        @title = title
        @href = href
      end
    end

    class PrimaryItem < ViewComponent::Base
      attr_accessor :title, :href

      renders_many :submenu_items,
        'UswdsComponents::BasicHeaderComponent::SubmenuItem'

      def initialize(title: '', href: '/', current: false)
        super
        @title = title
        @href = href
        @current = current
      end

      def submenu_id
        @submenu_id ||= "usa-nav__submenu_#{object_id.to_s(36)}"
      end

      def current?
        @current || current_page?(href)
      end
    end

    class SubmenuItem < ViewComponent::Base
      attr_accessor :name, :href

      def initialize(name: '', href: '/')
        super
        @name = name
        @href = href
      end
    end
  end
end
