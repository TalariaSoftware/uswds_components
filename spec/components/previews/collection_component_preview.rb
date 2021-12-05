# rubocop:disable Layout/LineLength
class CollectionComponentPreview < ViewComponent::Preview
  def calendar_display # rubocop:disable Metrics/MethodLength
    render UswdsComponents::CollectionComponent.new do |collection|
      collection.item(datetime: '2020-09-30T12:00:00+01:00',
        href: 'https://www.performance.gov/presidents-winners-press-release/') do |item|
        item.header { 'Gears of Government President’s Award winners' }
        "In honor of National Women’s Small Business Month, we’ve partnered with SBA’s Office of Government Contracting and Business Development and Office of Program Performance, Analysis, and Evaluation to highlight the Women-Owned Small Businesses (WOSBs) data dashboard!'"
      end

      collection.item(datetime: '2020-09-30T12:00:00+01:00',
        href: 'https://www.performance.gov/sba-wosb-dashboard/') do |item|
        item.header { 'Women-owned small business dashboard' }
        'In honor of National Women’s Small Business Month, we’ve partnered with SBA’s Office of Government Contracting and Business Development and Office of Program Performance, Analysis, and Evaluation to highlight the Women-Owned Small Businesses (WOSBs) data dashboard!'
      end

      collection.item(datetime: '2020-09-17T12:00:00+01:00',
        href: 'https://www.performance.gov/September-2020-Updates-Show-Progress/') do |item|
        item.header do
          'September 2020 updates show progress on cross-agency and agency priority goals'
        end
        'Today, we published progress updates for both Cross-Agency Priority (CAP) Goals and Agency Priority Goals (APGs) for the third quarter of FY2020. These updates highlight recent milestones and accomplishments as well as related initiatives that support progress towards a more modern and effective government.'
      end
    end
  end

  def headings_only # rubocop:disable Metrics/MethodLength
    render UswdsComponents::CollectionComponent.new do |collection|
      collection.item(href: 'https://digital.gov/guides/mobile-principles/?dg') do |item|
        item.header { 'The eight principles of mobile-friendliness' }
      end

      collection.item(href: 'https://designsystem.digital.gov/maturity-model/') do |item|
        item.header { 'The USWDS maturity model' }
      end

      collection.item(href: '#') do |item|
        item.header { 'A news item that’s on our own site' }
      end

      collection.item(href: 'https://18f.gsa.gov/2020/11/24/the-key-role-of-product-owners-in-federated-data-projects/') do |item|
        item.header do
          'The key role of product owners in federated data projects'
        end
      end

      collection.item(href: 'https://www.performance.gov/September-2020-Updates-Show-Progress/') do |item|
        item.header do
          'Progress on Cross-Agency Priority (CAP) goals and Agency Priority Goals (APGs)'
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
