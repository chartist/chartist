class DashboardsController < ApplicationController

  def show
    @dashboard = Dashboard.find params[:id]
    flash.now[:notice] = "Feel free to drag and drop the charts on this page."
  end

  def update
    @dashboard = Dashboard.find params[:id]
    @chart = Chart.find(params[:chart_id])
    @dashboard.charts << @chart unless @dashboard.charts.include?(@chart)
    render nothing: true
    # redirect_to chart_path(@chart)
  end
end
