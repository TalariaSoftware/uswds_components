require 'rails_helper'

#
# https://designsystem.digital.gov/components/language-selector/

RSpec.describe UswdsComponents::LanguageSelectorComponent, type: :component do
  subject(:component) { described_class.new(available_locales: locales) }

  before do
    original_url_for = component.method(:url_for)
    allow(component).to receive(:url_for) do |options|
      if options.is_a?(Hash) && options.keys == [:locale]
        "/current_path?locale=#{options[:locale]}"
      else
        original_url_for.call(options)
      end
    end

    render_inline(component)
  end

  describe "when there are two locales", pending: "Two-locale design" do
    let(:locales) { %i[en es] }

    it "has a link to the current locale" do
      expect(page).to have_link("English", href: '/current_path?locale=en')
    end

    it "has a link to another locale" do
      expect(page)
        .to have_link("español (Spanish)", href: '/current_path?locale=es')
    end
  end

  describe "when there are more than two locales" do
    let(:locales) { %i[en es fr] }

    it "has a languages button" do
      expect(page).to have_button("Languages")
    end

    it "has a link to the current locale" do
      expect(page).to have_link(
        "English",
        href: '/current_path?locale=en',
        visible: :hidden,
      )
    end

    it "has a link to another locale" do
      expect(page).to have_link(
        "español (Spanish)",
        href: '/current_path?locale=es',
        visible: :hidden,
      )
    end

    it "has a link to a third locale" do
      expect(page).to have_link(
        "français (French)",
        href: '/current_path?locale=fr',
        visible: :hidden,
      )
    end
  end
end
