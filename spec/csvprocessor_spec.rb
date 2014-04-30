require 'spec_helper'
require 'csvprocessor'

describe CSVProcessor do

  let(:processor1) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv')) }
  let(:processor2) { CSVProcessor.new(Rails.root.join('spec/extras/test5.csv')) }

  it "formats a simple csv file into an array of hashes" do
    expect(processor1.process.first).to eq({travel: "US", value: '75.00%'})
  end
  it "formats a multiple series csv file into an array of hashes" do
    expect(processor2.process.first).to eq({date: Time.new(2014,04,23, 12, 00), product_a: 5, product_b: 15})
  end

  it 'parses the date' do
    next_tuesday = Time.now.next_week(:tuesday) + 60*60*12
    expect(processor2.process.last).to eq({date: next_tuesday, product_a: 45, product_b: 140})
  end


end
