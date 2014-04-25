class ChartsController < ApplicationController

	def new
		@chart = Chart.new
	end
end
