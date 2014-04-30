require 'spec_helper'

describe "Multiple series chart" do

  let(:user) { create(:user) }

  let(:chart) {create(:mult_chart, user: user, id: 1)}

  it "outputs a chart" do
    visit chart_path(chart)
    expect(page).to have_css '.chart_container'
    expect(page).to have_css '#line_chart_1'
  end
end
