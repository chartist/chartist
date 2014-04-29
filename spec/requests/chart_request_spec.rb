require 'spec_helper'

describe "Charts API" do

  context "Retrieving data from a chart" do

    let(:pie_chart) { create(:pie_chart) }
    let(:line_chart) { create(:line_chart) }

    it "Returns the right JSON for simple file" do
      get chart_path(pie_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data['US']).to eq 75
      expect(chart_data['GB']).to eq 25
    end
  end
end
