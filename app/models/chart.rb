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


    validates :name, presence: true
    attr_accessor :dashboard_titles

    after_save :prepare_chart

    enum chart_type: [:pie_chart, :line_chart, :col_chart, :bar_chart]

    enum colorscheme: [:spring, :summer, :autumn, :winter]

    def prepare_chart
      self.colorscheme ||= 0
      add_to_default
      generate_dashboards
      return true unless csv.present?
      create_series
      create_datapoints
    end

    def rows(string)
      row = first_processed_row(string)
      row[1...row.size]
    end

    def create_series(string = nil)
      rows(string).each_with_index do |header, i|
        self.series << Series.create(name: header, order: i+1)
      end
    end

    def processor(string = nil)
      input = string || csv.path
      CSVProcessor.new(input, string.nil?)
    end

    def first_processed_row(string)
      processor(string).process.first
    end

    def create_datapoints(string = nil)
      processor(string).process[1..-1].each do |row|
        (1...row.size).each do |series_order|
          self.datapoints << Datapoint.create(x: row[0], y: row[series_order], series_id: series_ids[series_order-1])
        end
      end
      csv.destroy unless string
    end

    def series_ids
      self.series.map(&:id)
    end

    def table_data=(string)
      create_series(string)
      create_datapoints(string)
    end

    def add_to_default
      self.dashboards << Dashboard.where(title: self.user.username, user_id: self.user.id)
    end



    def generate_dashboards
      unless dashboard_titles.nil?
        # dashboard_titles << " #{user.username}"
        dashboard_titles.split.each do |title|
          add_dashboards(title, user.id)
        end
      end
    end

    def add_dashboards(title, user)
      self.dashboards << Dashboard.find_or_create_by(title: title, user_id: user)
    end



    def generate_json
      if self.pie_chart?
        self.datapoints.group(:x).sum(:y)
      else
        self.series.map do |series|
          { name: series.name, data: series.data }
        end
      end
    end

    def csv_headers
      [nil] + self.series.map(&:name)
    end

    def to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << csv_headers
        series_sorted.each do |x|
          csv << mapped_datapoints(x)
        end
      end
    end

    def mapped_datapoints(x)
      [x] + self.datapoints.where(x: x).map(&:y)
    end

    def series_sorted
      self.series.first.sorted
    end

    def to_param
      "#{id}-#{name.parameterize}"
    end

    def self.search(search)
      if search
        joins(:dashboards).where("name like ? OR dashboards.title like ?", "%#{search}%", "%#{search}%")
      else
        all
      end
    end
  end
