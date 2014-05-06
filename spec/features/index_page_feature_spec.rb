require 'spec_helper'

describe 'Chart index page' do

	let(:user) { create(:user) }
  let!(:chart) {create(:pie_chart, id: 1, user: user)}
  let!(:pie_chart) { create(:pie_chart, id: 2, user: user)}

  before { visit '/charts' }

  it 'shows the most recent chart' do
    expect(page).to have_css '#pie_chart_1'
  end

  it "shows all the chart" do
    expect(page).to have_css '#pie_chart_2'
  end
end
