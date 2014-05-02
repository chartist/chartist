require './lib/csvprocessor.rb'


class Chart < ActiveRecord::Base

  has_and_belongs_to_many :dashboards
  belongs_to :user
  has_many :datapoints
  has_many :series

  has_attached_file :csv, :default_url => "/images/missing.csv"
  validates_attachment :csv,
    content_type: {content_type: 'text/csv'},
    size: {in: 0..2.megabytes},
    presence: true,
  if: :new_record?


    attr_accessor :dashboard_titles


    after_save :prepare_chart

    enum chart_type: [:pie_chart, :line_chart, :col_chart, :bar_chart]
    enum colorscheme: [:default, :hockeytown, :scheme2, :scheme3]

    def prepare_chart
      return true unless csv.present?
      create_series
      create_datapoints
      generate_dashboards
      self.colorscheme ||= 0
    end

    def create_series
      csv_headers = CSV.read(csv.path).first
      csv_headers[1...csv_headers.size].each_with_index do |header, i|
        Series.create(name: header, order: i+1, chart_id: self.id)
      end
    end

    def create_datapoints
      processor = CSVProcessor.new(csv.path)
      processor.process.each do |row|
        (1...row.size).each do |series_order|
          current_series = Series.where(chart_id: self.id, order: series_order).first
          Datapoint.create(x: row.values[0], y: row.values[series_order], chart_id: self.id, series_id: current_series.id)
        end
      end
      csv.destroy
    end

    # def table_data=(json)
    #   data = JSON.parse(json)
    #   data.each do |row|
    #   end
    # end


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
        self.series.reverse.map { |series|
          { name: series.name, data: series.datapoints.group(:x).sum(:y) }
        }
      end
    end
  end
