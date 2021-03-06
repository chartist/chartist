class CSVProcessor

  def initialize(input, has_file)
    @input = input
    @has_file = has_file
  end

  def read
    roo = roo(@input)
    result = []
    (1..roo.last_row).each do |i|
      result << roo.row(i)
    end
    result
  end

  def roo(string)
    case Pathname.new(string).extname
    when '.csv'
      Roo::CSV.new(string, csv_options: {converters: :numeric})
    when '.xlsx'
      Roo::Excelx.new(string, csv_options: {converters: :numeric, encoding: Encoding::UTF_8})
    when '.xls'
      Roo::Excel.new(string, csv_options: {converters: :numeric, encoding: Encoding::UTF_8})
    end
  end

  def process
    array = @has_file ? self.read : self.parse
    array.each do |sub_array|
      sub_array[0] = Chronic.parse(sub_array.first).strftime('%F') unless not_chronicable?(sub_array)
    end
  end

  def parse
    CSV.parse(@input, converters: :numeric)
  end

  def not_chronicable?(array)
    Chronic.parse(array.first).nil? || array.first.class == Fixnum
  end

end
