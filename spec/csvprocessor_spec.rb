require 'spec_helper'
require 'csvprocessor'

describe CSVProcessor do

  let(:processor1) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv'), true) }
  let(:processor2) { CSVProcessor.new(Rails.root.join('spec/extras/test5.csv'), true) }

  context 'Processing files' do

    let(:processor1) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv'), true) }
    let(:processor2) { CSVProcessor.new(Rails.root.join('spec/extras/test5.csv'), true) }


    it "formats a simple csv file into an array of hashes" do
      expect(processor1.process[1]).to eq ["US", '75.00%']
    end

    it "formats a multiple series csv file into an array of hashes" do
      expect(processor2.process[1]).to eq [Time.new(2014,12,23, 12, 00), 5, 15]
    end

    it 'parses the date' do
      next_tuesday = Time.now.next_week(:tuesday) + 60*60*12
      expect(processor2.process.last).to eq [next_tuesday, 45, 140]
    end
  end

  context 'Processing strings' do

    let(:processor3) { CSVProcessor.new( "stuff,Maserati,Mazda,Mercedes,Mini,Mitsubishi\n2009,0,2941,4303,354,5814\n2010,5,2905,2867,412,5284\n2011,4,2517,4822,552,6127\n2012,2,2422,5399,776,4151\n", false) }

    it 'correctly processes a string' do
      expect(processor3.process.last).to eq [2012, 2, 2422, 5399, 776, 4151]
    end
  end

end
