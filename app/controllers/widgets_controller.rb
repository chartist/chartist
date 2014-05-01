class WidgetsController < ApplicationController
  def show
  	@chart = Chart.find(params[:chart_id])
  	render layout: false
  end
end
