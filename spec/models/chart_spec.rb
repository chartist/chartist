require 'spec_helper'

describe "Chart" do


  let(:chart) {Chart.create}

  it "turns a csv to a hash" do
    # expect(chart.csv_to_hash(Rails.root.join("spec/extras/test.csv"))).to eq {}
    chart.create_datapoints(Rails.root.join("spec/extras/test.csv"))
    expect(chart.datapoints.count).to eq(2)
    expect(chart.datapoints.last.x).to eq 'GB'
    expect(chart.datapoints.last.y).to eq 0.25
  end
end
