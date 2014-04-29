require 'spec_helper'

describe "User" do

	context "While logged out" do

		it "can't create a chart" do
			visit new_chart_path
			expect(page).to have_content "You need to sign in"
		end
	end
end
