class ExampleComponentPreview < ViewComponent::Preview
  def with_default_title
    render UswdsComponents::AlertComponent.new(status: :info,
      heading: 'Informative status') do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end
end
