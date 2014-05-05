require 'spec_helper'

describe "Dashboards" do

  let(:user) { create(:user, email: "foo@bar.com") }
  let(:pie_chart) {create(:pie_chart, user: user, dashboard_titles: "food")}
  let!(:chart_dashboards) {create(:chart_with_dashboards, user: user)}

  before do
    login_as user
  end

  context "when creating a chart" do

    it "can add to a dashboard" do
      visit "/charts/new"
      expect(page).to have_content "Pick a Board"
    end

    it "adds dashboards to that chart" do
      visit chart_path(pie_chart)
      expect(page).to have_content 'food'
    end
  end

  context "Looking for dashboards" do

    before do
      visit chart_path(pie_chart)
    end

    it "shows them" do
      expect(page).to have_link('food')
    end

    it "shows only the charts associated with that board" do
      click_link 'food'
      expect(page).not_to have_content 'miami'
      expect(page).to have_content "food"
    end
  end
end
