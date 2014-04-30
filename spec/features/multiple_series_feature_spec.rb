require 'spec_helper'

describe "Multiple series chart" do

  let(:user) { create(:user) }

  context "Pie chart" do


    let(:chart) {create(:mult_chart, user: user)}

    xit "outputs a chart" do
      visit chart_path(chart)

    end
  end
end
