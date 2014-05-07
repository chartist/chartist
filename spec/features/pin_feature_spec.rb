require "spec_helper"

describe 'Pinning charts to dashboard' do
  context 'Adds the chart to default dashboard for the user' do

    let(:user) { create(:user) }
    let!(:chart) { create(:chart_with_dashboards, user: user) }
    let(:user2) {create(:hacker)}

    it 'when the pin button is pressed' do
      login_as user2
      visit chart_path(chart)
      click_link 'pin'
      expect(chart.dashboards.map(&:title)).to include 'bar'
    end
  end
end
