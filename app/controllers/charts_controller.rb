class ChartsController < ApplicationController

  def new
    @chart = Chart.new
  end

  def create

    @chart = Chart.new params[:chart].permit(:name, :chart_type)
    params.permit(:csv)
    if @chart.save
      @chart.create_datapoints(params[:csv])
      redirect_to '/charts'
    else
      flash[:error] = "Oops! something went wrong"
      render "new"
    end
  end
end
