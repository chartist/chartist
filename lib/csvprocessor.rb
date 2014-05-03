
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
      sub_array[0] = Chronic.parse(sub_array.first) unless not_chronicable?(sub_array)
    end
  end

  def parse
    CSV.parse(@input, converters: :numeric)
  end

  def not_chronicable?(array)
    Chronic.parse(array.first).nil? || array.first.class == Fixnum
  end

end
