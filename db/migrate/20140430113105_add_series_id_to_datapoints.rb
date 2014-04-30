class AddSeriesIdToDatapoints < ActiveRecord::Migration
  def change
    add_reference :datapoints, :series, index: true
  end
end
