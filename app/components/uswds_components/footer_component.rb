module UswdsComponents
  class FooterComponent < ViewComponent::Base
    class SlimFooter < ViewComponent::Base
      attr_accessor :primary_links, :contact_links, :logo

      renders_one :logo, 'UswdsComponents::FooterComponent::Logo'
      renders_many :primary_links, 'UswdsComponents::FooterComponent::PrimaryLink'
      renders_many :contact_links, 'UswdsComponents::FooterComponent::ContactLink'
    end

    class Logo < ViewComponent::Base
      attr_accessor :src, :name

      def initialize(src:, name:)
        super
        @src = src
        @name = name
      end
    end

    class PrimaryLink < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href:, name:)
        super
        @href = href
        @name = name
      end
    end

    class ContactLink < ViewComponent::Base
      attr_accessor :href, :name

      def initialize(href:, name:)
        super
        @href = href
        @name = name
      end
    end
  end
end
