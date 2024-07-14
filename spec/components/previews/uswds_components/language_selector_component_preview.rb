class UswdsComponents::LanguageSelectorComponentPreview < ViewComponent::Preview
  # Language Selector Component
  # ----------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/language_selector/)
  def default
    render UswdsComponents::LanguageSelectorComponent
      .new(available_locales: I18n.available_locales)
  end
end
