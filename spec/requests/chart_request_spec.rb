require 'spec_helper'

describe "Charts API" do

  context "Generating data for a chart" do

    let(:pie_chart) { create(:pie_chart) }

    it "Returns the right JSON for a pie chart file" do
      get chart_path(pie_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data['US']).to eq 75
      expect(chart_data['GB']).to eq 25
    end

    let(:col_chart) { create(:col_chart) }

    it "Returns ta different JSON for other chart types" do
      get chart_path(col_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data[0]['data']['US']).to eq 75
      expect(chart_data[0]['data']['GB']).to eq 25
    end

    let(:line_chart) { create(:line_chart) }

    it 'Returns the right JSON for file with dates' do
      get chart_path(line_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      apr_23 = "2014-12-23"
      expect(chart_data[0]['data'][apr_23]).to eq 5
      next_tuesday = "2014-05-06"
      expect(chart_data[0]['data'][next_tuesday]).to eq 45
    end

    let(:mult_chart) { create(:mult_chart) }

    it 'Returns the right JSON for multi-series chart' do
      get chart_path(mult_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data[0]['name']).to eq 'Product B'
      expect(chart_data[1]['name']).to eq 'Product A'
      expect(chart_data[0]['data']['2014-12-24']).to eq 7
      expect(chart_data[1]['data']['2014-12-24']).to eq 17
    end
  end
end
