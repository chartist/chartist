require 'spec_helper'

describe "User" do



  context "While logged out" do

    it "can't create a chart" do
      visit new_chart_path
      expect(page).to have_content "You need to sign in"
    end
  end

  context "while logged in" do


    let(:user) { create(:user, email: "mario@mario.com") }

    before do
      create(:line_chart, user: user)
    end

    it "can create a chart" do
      expect(user.charts.count).to eq 1
    end
  end
end
