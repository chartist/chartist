module ChartsHelper


  def graphic_of(chart)
    options = { id: "#{chart.chart_type}_#{chart.id}", colors: color_select(chart.colorscheme) }
    send(chart.chart_type, chart_path(chart, format: :json), options).html_safe
  end

  def color_select(colorscheme)
    colors = {
      'spring' => ['#4EB8E6', '#EA729A', '#FDD017', '#9DC209', '#B1B1B1'],
      'summer' => ["#c0392b", "#3498db", "#E20E0B", "#BED334", "#B5CEE2"] ,
      'autumn' => ['#305E5C', '#6D833D', '#FCC362', '#F2872B', '#D36613'],
      'winter' => ['#606A82', '#93110A', '#C91000', '#B7915F', '#DDCABC']
    }
    colors[colorscheme]
  end
end
