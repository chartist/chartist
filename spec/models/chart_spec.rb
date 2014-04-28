require 'spec_helper'

describe Chart do


  let(:chart) {create(:chart)}

  it "creates datapoints in the database correctly" do
    expect(chart.datapoints.count).to eq(2)
    expect(chart.datapoints.last.x).to eq 'GB'
    expect(chart.datapoints.last.y).to eq 0.25
  end
end
