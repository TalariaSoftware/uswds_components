module UswdsComponents
  class LanguageSelectorComponent < ViewComponent::Base
    attr_accessor :available_locales

    def initialize(available_locales: I18n.locales)
      super
      @available_locales = available_locales
    end

    def locale_name(locale)
      t ".locales.#{locale}"
    end

    def native_name(locale)
      I18n.with_locale(locale) { t ".locales.#{locale}" }
    end

    def locale_path(locale)
      url_for(locale: locale)
    end
  end
end
