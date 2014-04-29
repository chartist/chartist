require 'spec_helper'

describe 'Chart index page' do
  
	
  let!(:chart) {create(:pie_chart)}

  
  it 'shows the most recent chart' do

    visit '/charts'
    expect(page).to have_css '#pie_chart_1'
  end
end
