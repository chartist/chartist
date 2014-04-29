require 'spec_helper'

describe "Building a chart" do

  context "Pie chart" do

    let(:chart) {create(:pie_chart)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
    end
  end
    context "Line chart" do

    let(:chart) {create(:line_chart)}

    # it "outputs a chart" do
    #   visit '/charts/new'
    #   fill
    # end
  end
end
