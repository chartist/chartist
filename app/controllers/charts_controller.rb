class ChartsController < ApplicationController

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv)
    if @chart.save
      @chart.create_datapoints @chart.csv.path
      @chart.csv.destroy
      redirect_to chart_path(@chart)
    else
      flash[:error] = "Oops! something went wrong"
      render "new"
    end
  end

  def show
    @chart = Chart.find params[:id]
  end
end
