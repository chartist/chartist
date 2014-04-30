class Datapoint < ActiveRecord::Base
  belongs_to :chart
  belongs_to :series
end
