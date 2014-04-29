require 'spec_helper'

describe "Charts API" do

  context "Retrieving data from a chart" do

    let(:chart) { create(:pie_chart) }

    it "Returns the right JSON" do
      get chart_path(chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data['US']).to eq 0.75
      expect(chart_data['GB']).to eq 0.25
    end
  end
end
