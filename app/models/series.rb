class Series < ActiveRecord::Base
  belongs_to :chart
  has_many :datapoints
end
