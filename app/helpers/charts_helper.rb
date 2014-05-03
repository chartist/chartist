module ChartsHelper


  def graphic_of(chart)
    options = { id: "#{chart.chart_type}_#{chart.id}", colors: color_select(chart.colorscheme) }
    options.merge! library: { :hAxis => {:format => 'd-MMM-yy'}} if chart.line_chart?
    options.merge! height: "#{params[:height]}px" if params[:height]
    send(chart.chart_type, chart_path(chart, format: :json), options).html_safe
  end

  def color_select(colorscheme)
    colors = {
      'spring' => ['#4EB8E6', '#EA729A', '#FDD017', '#9DC209', '#B1B1B1'],
      'summer' => ['#E20E0B', '#FFE833', '#BED334', '#4C9BDB', '#B5CEE2'],
      'autumn' => ['#AE3A12', '#D17A17', '#CBB266', '#AFBDA5', '#4A7051'],
      'winter' => ['#606A82', '#93110A', '#C91000', '#B7915F', '#DDCABC']
    }
    colors[colorscheme]
  end
end
