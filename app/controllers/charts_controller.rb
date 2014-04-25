class ChartsController < ApplicationController

	def new
		@chart = Chart.new
	end

	def create
		# @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv)
		# if @chart.save
			
	end
end
