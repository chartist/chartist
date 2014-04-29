class ChartsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv)
    if @chart.save
      redirect_to chart_path(@chart)
    else
      flash[:error] = "Oops! something went wrong"
      render "new"
    end
  end

  def show
    @chart = Chart.find params[:id]
    respond_to do |format|
      format.json { render json: @chart.datapoints.group(:x).sum(:y) }
      format.html
    end
  end
end
