class ChartsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv)
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
      format.json { render json: @chart.series.reverse.map { |series|
                      { name: series.name, data: series.datapoints.group(:x).sum(:y) }
                    }
                    }
      format.html
    end
  end

  def index
    @charts = Chart.all
  end
end


#  @goals.map{|goal|
#     {name: goal.name, data: goal.feats.group_by_week(:created_at).count}
# }

# @chart.series.map {|series|
#   name: series.name, date: series.datapoints.group(:x).sum(:y)
# }
