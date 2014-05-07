require "spec_helper"

describe 'Pinning charts to dashboard' do

  let(:user) { create(:user) }
  let!(:chart) { create(:chart_with_dashboards, user: user) }
  let(:user2) {create(:hacker)}

  xit 'when the pin button is pressed', js: true do

    login_as user2
    visit chart_path(chart)
    click_on 'bar'
    expect(chart.dashboards.map(&:title)).to include 'bar'
  end
end
