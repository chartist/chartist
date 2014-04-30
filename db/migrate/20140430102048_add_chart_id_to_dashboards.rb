class AddChartIdToDashboards < ActiveRecord::Migration
  def change
    add_reference :dashboards, :chart, index: true
  end
end
