module UswdsComponents
  class HeaderComponent < ViewComponent::Base
    attr_accessor :logo_title, :logo_href, :primary_items, :menu_button_text,
      :close_content

    def initialize(logo_title: '', logo_href: '/', primary_items: [],
      menu_button_text: 'Menu', close_content: 'X')
      super
      @logo_title = logo_title
      @logo_href = logo_href
      @primary_items = primary_items
      @menu_button_text = menu_button_text
      @close_content = close_content
    end

    def navbar
      Navbar.new
    end

    def logo
      Logo.new(href: logo_href, title: logo_title)
    end

    def nav
      HeaderComponent::Nav.new(close_content: close_content)
    end

    def menu_button
      MenuButton.new
    end

    class Header < ViewComponent::Base
    end

    class Navbar < ViewComponent::Base
    end

    class Logo < ViewComponent::Base
      attr_accessor :href, :title

      def initialize(href: '', title: '')
        super
        @href = href
        @title = title
      end
    end

    class MenuButton < ViewComponent::Base
    end

    class Nav < ViewComponent::Base
      attr_accessor :close_content

      def initialize(close_content: '')
        super
        @close_content = close_content
      end
    end

    class PrimaryList < ViewComponent::Base
    end

    class PrimaryItem < ViewComponent::Base
    end

    class Link < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href: '', name: '')
        super
        @href = href
        @name = name
      end
    end

    class Submenu < ViewComponent::Base
      attr_accessor :title, :items

      def initialize(title: '', items: [])
        super
        @title = title
        @items = items
      end

      def submenu_id
        @submenu_id ||= "usa-nav__submenu_#{object_id.to_s(36)}"
      end
    end

    class SubmenuItem < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href: '', name: '')
        super
        @href = href
        @name = name
      end
    end
  end
end
