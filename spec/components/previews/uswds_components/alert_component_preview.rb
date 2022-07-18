class UswdsComponents::AlertComponentPreview < ViewComponent::Preview
  # Alert Component
  # ----------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/alert/)
  #
  # To create a slim alert, leave the heading blank.
  #
  # @param status [Symbol] select [info, warning, error, success]
  # @param icon toggle
  # @param heading
  # @param body
  def default(status: :info, icon: true, heading: 'Status heading',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.')
    render UswdsComponents::AlertComponent.new(status: status, heading: heading,
      include_icon: icon) do
      body
    end
  end
end
