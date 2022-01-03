class UswdsComponents::AlertComponentPreview < ViewComponent::Preview
  def info
    render UswdsComponents::AlertComponent.new(status: :info,
      heading: 'Informative status') do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end

  def warning
    render UswdsComponents::AlertComponent.new(status: :warning,
      heading: 'Warning status') do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end

  def error
    render UswdsComponents::AlertComponent.new(status: :error, heading: 'Error status') do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end

  def success
    render UswdsComponents::AlertComponent.new(status: :success,
      heading: 'Success status') do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end

  def slim
    render UswdsComponents::AlertComponent.new do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end

  def no_icon
    render UswdsComponents::AlertComponent.new(include_icon: false) do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'
    end
  end
end
