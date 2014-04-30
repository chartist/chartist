require 'spec_helper'

describe 'Chart index page' do
  
	
  let!(:chart) {create(:pie_chart, id: 1)}
  let!(:pie_chart) { create(:pie_chart, id: 2) }

  before { visit '/charts' }
  
  it 'shows the most recent chart' do
    expect(page).to have_css '#pie_chart_1'
  end

  it "shows all the chart" do
  	expect(page).to have_css '#pie_chart_2'
  end
end
