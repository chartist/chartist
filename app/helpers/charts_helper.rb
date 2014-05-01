module ChartsHelper


	def graphic_of(chart)
		options = { id: "#{chart.chart_type}_#{chart.id}" }
		options.merge! library: { :hAxis => {:format => 'd-MMM-yy'}} if chart.line_chart?
		options.merge! height: "#{params[:height]}px" if params[:height]
    send(chart.chart_type, chart_path(chart, format: :json), options).html_safe
  end
end
