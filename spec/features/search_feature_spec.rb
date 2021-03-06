require 'spec_helper'

describe "Search engine" do

	let(:foo) { create(:user) }

	let(:mario) { create(:mario) }

	before do
		create(:bar_chart, user: foo)
		create(:col_chart, user: mario)
		create(:chart_with_dashboards, user: mario)
		login_as foo
		visit "/charts"
	end

	it "shows results for chart names" do
		fill_in 'search', with: 'jobs'
		click_button 'search-btn'
		expect(page).to have_content 'jobs for undergrads'
		expect(page).not_to have_content 'Mortality rates'
	end

	it 'shows results for dashboards' do
		fill_in 'search', with: 'miami'
		click_button 'search-btn'
		expect(page).to have_content 'US chart'
		expect(page).not_to have_content 'jobs for undergrads'
	end
end
