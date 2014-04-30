require 'spec_helper'

describe "Dashboards" do

	let(:user) { create(:user, email: "foo@bar.com") }
	
	before do
		login_as user
	end

	context "Choosing a dashboard for a chart" do
		
		it "shows field" do 
			visit "/charts/new"
			expect(page).to have_content "Dashboard"
		end
	end
end
