require 'spec_helper'

describe "Building a chart" do

  context "creating a chart" do

    before do
      create(:chart)
    end

    it "creates a chart with a csv" do
      visit "/charts/1"
      expect(page).to have_css ".chart_container"
    end
  end
end
