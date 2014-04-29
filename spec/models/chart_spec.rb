require 'spec_helper'

describe Chart do


  let(:chart) {create(:pie_chart)}

  it "creates datapoints in the database correctly" do
    expect(chart.datapoints.count).to eq(2)
    expect(chart.datapoints.last.x).to eq 'GB'
    expect(chart.datapoints.last.y).to eq 0.25
  end

  context 'Validations' do

    it "content type" do
      should validate_attachment_content_type(:csv).
        allowing("text/csv").
        rejecting('text/plain', 'text/xml', 'image/jpg')
    end

    it "size" do
      should validate_attachment_size(:csv).
        less_than(2.megabytes)
    end
    it "presence" do
      should validate_attachment_presence(:csv)
    end
  end
  context 'Enumeration' do
    
    let(:line_chart) {create(:line_chart)}
    let(:pie_chart) {create(:pie_chart)}
    
    it 'knows the type of the chart' do
      expect(line_chart.line_chart?).to be_true
      expect(pie_chart.pie_chart?).to be_true
      expect(line_chart.pie_chart?).not_to be_true
    end
  end
end
