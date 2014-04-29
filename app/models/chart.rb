require './lib/csvprocessor.rb'

class Chart < ActiveRecord::Base

  has_many :datapoints
  has_attached_file :csv, :default_url => "/images/missing.csv"
  validates_attachment :csv,

    content_type: {content_type: 'text/csv'},
    size: {in: 0..2.megabytes},
    presence: true

  after_save :create_datapoints

  enum chart_type: [:pie_chart, :line_chart, :col_chart, :bar_chart]

  def create_datapoints
    processor = CSVProcessor.new(csv.path)
    processor.process.each do |row|
      Datapoint.create(x: row.values[0], y: row.values[1], chart_id: self.id)
    end
    csv.destroy
  end
end
