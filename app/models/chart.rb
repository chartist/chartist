require 'smarter_csv'

class Chart < ActiveRecord::Base

	def process(filename)
		SmarterCSV.process(filename)
	end
end
