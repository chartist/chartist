require 'spec_helper'

describe "Dashboards" do

  let(:user) { create(:user, email: "foo@bar.com") }

  before do
    login_as user
    create(:chart_with_dashboards, user: user, dashboard_titles: "foobar")
  end

  context "when creating a chart" do

    it "can add to a dashboard" do
      visit "/charts/new"
      expect(page).to have_content "Pick a Board"
    end

    it "adds dashboards to that chart" do
      visit "/charts"
      expect(page).to have_content 'foobar'
    end
  end

  context "Looking for dashboards" do

    before do
      create(:chart_with_dashboards, user: user)
      visit "/charts"
    end

    it "shows them" do
      expect(page).to have_link('miami')
    end

    it "shows only the charts associated with that board" do
      click_link 'foobar'
      expect(page).not_to have_content "miami"
      expect(page).to have_content "foobar"
    end
  end
end
