require 'spec_helper'

describe "Dashboards" do

  let(:user) { create(:user, email: "foo@bar.com") }

  before do
    login_as user
    create(:chart_with_dashboards, user: user)
    create(:pie_chart, user: user, dashboard_titles: "food")
  end

  context "when creating a chart" do

    it "can add to a dashboard" do
      visit "/charts/new"
      expect(page).to have_content "Pick a Board"
    end

    it "adds dashboards to that chart" do
      visit "/charts"
      expect(page).to have_content 'miami'
    end
  end

  context "Looking for dashboards" do

    before do
      visit "/charts"
    end

    it "shows them" do
      expect(page).to have_link('miami')
    end

    it "shows only the charts associated with that board" do
      click_link 'miami'
      expect(page).not_to have_content 'food'
      expect(page).to have_content "miami"
    end
  end
end
