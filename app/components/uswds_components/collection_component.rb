module UswdsComponents
  class CollectionComponent < ViewComponent::Base
    renders_many :items, 'Item'

    class Item < ViewComponent::Base
      attr_accessor :href, :datetime

      renders_one :header

      def initialize(href: nil, datetime: nil)
        super
        @datetime = datetime
        @href = href

        ensure_valid_datetime
      end

      private

      def ensure_valid_datetime
        @datetime = DateTime.parse(datetime) if datetime.is_a?(String)
      rescue Date::Error
        @datetime = nil
      end
    end
  end
end
