require 'spec_helper'

describe "Building a chart" do

	context "creating a chart" do 
		
		before do
			visit "/charts/new"
		end

		it "shows the form to create one" do
			fill_in('Name', with: "Football chart")
			page.choose('chart_chart_type_pie_chart')
			attach_file('chart_csv', Rails.root.join("spec/extras/test.csv"))
			click_button "Generate"
			expect(page).to have_css ".chart_container"
		end
	end
end
