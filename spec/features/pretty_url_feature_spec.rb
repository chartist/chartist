require 'spec_helper'

describe "Pretty URLs" do

	let(:user) { create(:user) }

	let!(:chart) { create(:chart_with_dashboards, id: 1, user: user, dashboard_titles: "foobar") }



	context "Charts" do


		it "URL is the same as the name" do
			visit chart_path(chart)
			expect(current_path).to eq '/charts/1-us-chart'
		end

		it "is the same for JSON" do
			visit chart_path(chart, format: :json)
			expect(current_path).to eq '/charts/1-us-chart.json'
		end
	end

	context "Dashboards" do

		it "URL is the same as the title" do
			dashboard = chart.dashboards.last
			visit dashboard_path(dashboard)
			expect(current_path).to eq "/dashboards/#{dashboard.id}-foobar"
		end 
	end
end
