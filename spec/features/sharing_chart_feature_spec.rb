require 'spec_helper'

describe "Sharing a chart" do

  let(:user) { create(:user) }
  let(:chart) { create(:line_chart, user: user) }

  it "should have sharing buttons" do

    visit chart_path(chart)
    expect(page).to have_css('.addthis_toolbox')
    
  end

end