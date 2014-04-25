require 'smarter_csv'

class Chart < ActiveRecord::Base

	has_many :datapoints

	def process(filename)
		SmarterCSV.process(filename)
	end
end
