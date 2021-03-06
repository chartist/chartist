class Series < ActiveRecord::Base
  belongs_to :chart
  has_many :datapoints

  def sorted
  	self.datapoints.map(&:x).sort
  end

  def data
		self.datapoints.group(:x).sum(:y)
 	end
end
