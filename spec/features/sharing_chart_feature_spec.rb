require 'spec_helper'

describe "Sharing a chart" do

  let!(:user) { create(:user) }
  let!(:chart) { create(:pie_chart, user: user, id: 2) }

  before { visit chart_path(chart) }
  
  it "should have sharing buttons" do
    expect(page).to have_css('.addthis_toolbox')    
  end

  context "Embedding a chart" do

  	it "shows the link for the widget" do
  		expect(page).to have_css("#d_clip_button")
  	end

  	it "generates a script for the chart" do
  		visit chart_widget_path(chart)
  		expect(page).not_to have_css('.nav')
  	end
  end
end

