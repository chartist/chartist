
json.chart @chart.datapoints.group(:x).sum(:y)

# json.array! @chart.datapoints do |datapoint|
# 	json.x datapoint.x
# 	json.y datapoint.y
# end


# {"JP"=>0.6, "NZ"=>0.1, "VE"=>0.1, "GB"=>0.1, "US"=>0.1}
