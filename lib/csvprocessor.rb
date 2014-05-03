
require 'smarter_csv'
require 'chronic'

class CSVProcessor

  def initialize(input, has_file)
    @input = input
    @has_file = has_file
  end

  def read
    CSV.read(@input, converters: :numeric)
  end

  def process
    @has_file ? array = self.read : array = self.parse
    array.each do |sub_array|
      sub_array[0] = Chronic.parse(sub_array.first) if Chronic.parse(sub_array.first)
    end
  end

  def parse
    CSV.parse(@input)
  end

end
