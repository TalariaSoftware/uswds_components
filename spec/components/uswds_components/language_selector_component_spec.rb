require 'rails_helper'

#
# https://designsystem.digital.gov/components/language-selector/

RSpec.describe UswdsComponents::LanguageSelectorComponent,
  pending: "URLS in specs", type: :component do
  subject(:component) { described_class.new(available_locales: locales) }

  before do
    render_inline(component)
  end

  describe "when there are two locales" do
    let(:locales) { %w[en es] }

    it "has a link to the current locale" do
      expect(page).to have_link("English", href: '/?locale=en')
    end

    it "has a link to another locale" do
      expect(page)
        .to have_link("español (Spanish)", href: '/?locale=es')
    end
  end

  describe "when there are more than two locales" do
    let(:locales) { %w[en es fr] }

    it "has a link to the current locale" do
      expect(page).to have_link("English", href: '/?locale=en')
    end

    it "has a link to another locale" do
      expect(page)
        .to have_link("español (Spanish)", href: '/?locale=es')
    end

    it "has a link to a third locale" do
      expect(page)
        .to have_link("français (French)", href: '/?locale=fr')
    end
  end
end
