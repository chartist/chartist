require 'spec_helper'

describe "Building a chart" do

  context "Pie chart" do

    let(:chart) {create(:pie_chart)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#pie_chart_1'
    end
  end

  context "Column chart" do

    let(:chart) {create(:col_chart)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#col_chart_2'
    end
  end
  
  context "Bar chart" do

    let(:chart) {create(:bar_chart)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#bar_chart_3'
    end
  end
  
  context "Line chart" do

    let(:chart) {create(:line_chart)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#line_chart_4'
    end
  end
    
  # context "Line chart" do
    
  #   # let(:chart) {create(:line_chart)}

  #   it "outputs a chart" do
  #     visit '/charts/new'

  #     fill_in 'Name', with: "Line chart"
  #     choose 'Line chart'
  #     attach_file 'chart_csv', Rails.root.join('spec/extras/test.csv')
  #     click_button 'Generate'
  #     expect(Chart.last.line_chart?).to be_true
  #     expect(page).to have_css '.chart_container'
      
  #   end

  # end
end
