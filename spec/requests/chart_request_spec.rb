require 'spec_helper'

describe "Charts API" do

  context "Generating data for a chart" do

    let(:pie_chart) { create(:pie_chart) }

    it "Returns the right JSON for simple file" do
      get chart_path(pie_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      expect(chart_data['US']).to eq 75
      expect(chart_data['GB']).to eq 25
    end

    let(:line_chart) { create(:line_chart) }

    it 'Returns the right JSON for file with dates' do
      get chart_path(line_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)
      apr_23 = "2014-04-23 11:00:00.000000"
      expect(chart_data[apr_23]).to eq 5
      next_tuesday = "2014-05-06 11:00:00.000000"
      expect(chart_data[next_tuesday]).to eq 45
    end

    let(:mult_chart) { create(:mult_chart) }

    xit 'Returns the right JSON for multi-series chart' do
      get chart_path(mult_chart, format: :json)
      expect(response).to be_success
      chart_data = JSON.parse(response.body)




    end
  end
end
