require 'spec_helper'

describe "Dashboards" do

	let(:user) { create(:user, email: "foo@bar.com") }
	
	before do
		login_as user
	end

	context "Choosing a dashboard for a chart" do
		
		it "shows the field" do 
			visit "/charts/new"
			expect(page).to have_content "Dashboard"
		end

		it "adds dashboards to that chart" do
			visit "/charts/new"
			add_pie_chart('Pie chart', 'uk london')
			expect(Chart.last.dashboards.count).to eq 2
		end
	end
end
