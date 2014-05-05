require './lib/csvprocessor.rb'


class Chart < ActiveRecord::Base

  has_and_belongs_to_many :dashboards
  belongs_to :user
  has_many :datapoints
  has_many :series

  has_attached_file :csv, :default_url => "/images/missing.csv"
  validates_attachment :csv,
    content_type: {content_type: ['text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']},
    size: {in: 0..2.megabytes},
    # presence: true,
  if: :new_record?


    attr_accessor :dashboard_titles


    after_save :prepare_chart

    enum chart_type: [:pie_chart, :line_chart, :col_chart, :bar_chart]

    enum colorscheme: [:spring, :summer, :autumn, :winter]

    # enum x_type: [:normal, :date]


    def prepare_chart
      self.colorscheme ||= 0
      generate_dashboards
      return true unless csv.present?
      create_series
      create_datapoints
    end

    def create_series(string = nil)
      input = string || csv.path
      processor = CSVProcessor.new(input, string.nil?)
      csv_headers = processor.process.first
      csv_headers[1...csv_headers.size].each_with_index do |header, i|
        self.series << Series.create(name: header, order: i+1)
      end
    end

    def create_datapoints(string = nil)
      input = string || csv.path
      processor = CSVProcessor.new(input, string.nil?)
      series_ids = self.series.map(&:id)
      processor.process[1..-1].each do |row|
        (1...row.size).each do |series_order|
          self.datapoints << Datapoint.create(x: row[0], y: row[series_order], series_id: series_ids[series_order-1])
        end
      end
      csv.destroy unless string
    end

    def table_data=(string)
      create_series(string)
      create_datapoints(string)
    end


    def generate_dashboards
      unless dashboard_titles.nil?
        dashboard_titles.split.each do |title|
          self.dashboards << Dashboard.find_or_create_by(title: title)
        end
      end
    end

    def generate_json
      if self.pie_chart?
        self.datapoints.group(:x).sum(:y)
      else
        self.series.map { |series|
          { name: series.name, data: series.datapoints.group(:x).sum(:y) }
        }
      end
    end

    def to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << [nil] + self.series.map(&:name)
        self.series.first.datapoints.map(&:x).sort.each do |x|
          csv << [x] + self.datapoints.where(x: x).map(&:y)
        end
      end
    end
  end
