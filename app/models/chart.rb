require './lib/csvprocessor.rb'

class Chart < ActiveRecord::Base

  has_and_belongs_to_many :dashboards
  belongs_to :user
  has_many :datapoints
  has_attached_file :csv, :default_url => "/images/missing.csv"
  validates_attachment :csv,

    content_type: {content_type: 'text/csv'},
    size: {in: 0..2.megabytes},
    presence: true

  attr_accessor :dashboard_titles

  after_save :create_datapoints
  after_save :generate_dashboards

  enum chart_type: [:pie_chart, :line_chart, :col_chart, :bar_chart]

  def create_datapoints
    processor = CSVProcessor.new(csv.path)
    processor.process.each do |row|
      Datapoint.create(x: row.values[0], y: row.values[1], chart_id: self.id)
    end
    csv.destroy
  end


  def generate_dashboards
    unless dashboard_titles.nil?
      dashboard_titles.split.each do |title|
        self.dashboards << Dashboard.find_or_create_by(title: title)
      end
    end
  end
end
