require 'spec_helper'
require 'csvprocessor'

describe CSVProcessor do

  let(:processor1) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv').to_s, true) }
  let(:processor2) { CSVProcessor.new(Rails.root.join('spec/extras/test5.csv').to_s, true) }

  context 'Processing files' do

    let(:processor1) { CSVProcessor.new(Rails.root.join('spec/extras/test.csv').to_s, true) }
    let(:processor2) { CSVProcessor.new(Rails.root.join('spec/extras/test5.csv').to_s, true) }


    it "formats a simple csv file into an array" do
      expect(processor1.process[1]).to eq ["US", '75.00%']
    end

    it "formats a multiple series csv file into an array" do
      expect(processor2.process[1]).to eq ['2014-12-23', 5, 15]
    end

    it 'parses the date' do
      next_tuesday = (date_of_next "Tuesday").strftime('%F')
      expect(processor2.process.last).to eq [next_tuesday, 45, 140]
    end
  end

  context 'Processing strings' do

    let(:processor3) { CSVProcessor.new( "stuff,Maserati,Mazda,Mercedes,Mini,Mitsubishi\n2009,0,2941,4303,354,5814\n2010,5,2905,2867,412,5284\n2011,4,2517,4822,552,6127\n2012,2,2422,5399,776,4151\n", false) }

    it 'correctly processes a string' do
      expect(processor3.process.last).to eq [2012, 2, 2422, 5399, 776, 4151]
    end
  end

  context 'Processing Excel files' do
    let(:excel_processor) { CSVProcessor.new(Rails.root.join('spec/extras/test.xlsx').to_s, true) }
    let(:excel_multiple_processor) { CSVProcessor.new(Rails.root.join('spec/extras/test5.xlsx').to_s, true) }

    it 'formats a simple Excel file into an array' do
      expect(excel_processor.process[1]).to eq ["US", 0.75]
    end

    it "formats a multiple series Excel file into an array" do
      expect(excel_multiple_processor.process[1]).to eq ['2014-12-23', 5, 15]
    end

  end

end
