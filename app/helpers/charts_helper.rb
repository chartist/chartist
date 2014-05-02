module ChartsHelper


  def graphic_of(chart)
    options = { id: "#{chart.chart_type}_#{chart.id}", colors: color_select(chart.colorscheme) }
    options.merge! library: { :hAxis => {:format => 'd-MMM-yy'}} if chart.line_chart?
    options.merge! height: "#{params[:height]}px" if params[:height]
    send(chart.chart_type, chart_path(chart, format: :json), options).html_safe
  end

  def color_select(colorscheme)
    colors = {
      "default" => ['#3366cc', '#dc3912', '#ff9900', '#109618'],
      'hockeytown' => ['#E56717', '#1796E6', '#FDD017', '#9DC209', 'A690BF']
    }
    colors[colorscheme]
  end
end
