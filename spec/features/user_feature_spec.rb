require 'spec_helper'

describe "User" do



  context "While logged out" do

    it "can't create a chart" do
      visit new_chart_path
      expect(page).to have_content "You need to sign in"
    end
  end

  context "while logged in" do

    let(:user1) { create(:user, email: "mario@mario.com") }
    let(:user2) { create(:hacker, email: "hacker@test.com") }
    let!(:line_chart) { create(:line_chart, user: user1) }
    let!(:pie_chart) { create(:pie_chart, user: user2) }

    it "can create a chart" do
      expect(user1.charts.count).to eq 1
    end

    it "user can view all of her charts" do
      login_as user1
      visit '/charts'
      click_link('My Charts')
      expect(page).to have_content('Line chart')
      expect(page).not_to have_content('Pie chart')
    end
  end
end
