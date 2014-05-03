class ChartsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv, :dashboard_titles, :colorscheme, :table_data)
    @chart.user = current_user
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
      format.json {render json: @chart.generate_json }
      format.html
      format.csv { send_data @chart.to_csv}
      # format.xlsx { send_data @chart.to_csv(col_sep: "\t") }
    end
  end

  def index
    @charts = Chart.all
  end

  def destroy
    @chart = Chart.find params[:id]
    @chart.destroy
    redirect_to '/charts'
  end

  def edit
    @chart = Chart.find params[:id]
  end

  def update
    @chart = Chart.find params[:id]
    @chart.csv = nil
    @chart.update! params[:chart].permit(:name, :chart_type, :dashboard_titles)
    redirect_to chart_path(@chart)
  end
end
