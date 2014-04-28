require 'spec_helper'

describe "Building a chart" do

  context "creating a chart" do

    let(:chart) {create(:chart)}

    it "creates a chart with a csv" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
    end
  end
end
