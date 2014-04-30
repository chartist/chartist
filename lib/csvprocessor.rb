
require 'smarter_csv'
require 'chronic'

class CSVProcessor

  def initialize(file)
    @file = file
  end

  def process
    array = SmarterCSV.process(@file)
    col_name = array.first.keys.first
    result = array.each do |hash|
      hash[col_name] = Chronic.parse(hash[col_name]) if Chronic.parse(hash[col_name])
    end
  end
end
