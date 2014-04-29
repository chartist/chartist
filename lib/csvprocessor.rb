require 'smarter_csv'

class CSVProcessor
  
  def initialize(file)
    @file = file
  end

  def process
    array = SmarterCSV.process(@file)
    result = array.each do |hash|
      hash[:value] = (hash[:value]).to_f
    end
  end
end
