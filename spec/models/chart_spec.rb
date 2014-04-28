require 'spec_helper'

describe Chart do


  let(:chart) {create(:chart)}

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
  end
end
