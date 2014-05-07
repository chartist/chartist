class DashboardsController < ApplicationController

  def show
    @dashboard = Dashboard.find params[:id]
  end

  def update
    @dashboard = Dashboard.find params[:id]
    @chart = Chart.find(params[:chart_id])
    @dashboard.charts << @chart unless @dashboard.charts.include?(@chart)
    render nothing: true
    # redirect_to chart_path(@chart)
  end
end
