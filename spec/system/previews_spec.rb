require 'rails_helper'

RSpec.describe "Previews", type: :system do
  before { driven_by(:rack_test) }

  ViewComponent::Preview.all.each do |preview|
    context "with #{preview}" do
      scenario "Visit preview and examples" do
        visit "rails/view_components/#{preview.preview_name}"

        preview.examples.each do |sample|
          visit "rails/view_components/#{preview.preview_name}/#{sample}"
        end
      end
    end
  end
end
