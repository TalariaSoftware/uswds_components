module UswdsComponents
  class SearchComponent < ViewComponent::Base
    attr_accessor :form_options, :query_param, :submit_icon,
      :size

    def initialize(form_options: { url: '' }, query_param: :q, submit_icon: '',
      size: :default)
      super
      @form_options = form_options
      @query_param = query_param
      @submit_icon = submit_icon
      @size = size
    end

    def query_field_id
      @query_field_id ||= "query_field_id_#{object_id.to_s(36)}"
    end

    def small?
      size == :small
    end

    def big?
      size == :big
    end

    def form_classes
      classes = ['usa-search']
      classes << 'usa-search--big' if big?
      classes << 'usa-search--small' if small?

      classes
    end
  end
end
