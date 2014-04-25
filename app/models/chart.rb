require './lib/csvprocessor.rb'

class Chart < ActiveRecord::Base

  has_many :datapoints

  def create_datapoints(file)
    csv = CSVProcessor.new(file)
    csv.process.each do |row|
      Datapoint.create(x: row.values[0], y: row.values[1], chart_id: self.id)
    end
  end
end
