require 'spec_helper'

describe "CsvProcessor" do

  let(:processor) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv')) }

  it "formats a csv file into an array of hashes" do
    expect(processor.process.first).to eq({travel: "US", value: '75.00%'})
  end
end
