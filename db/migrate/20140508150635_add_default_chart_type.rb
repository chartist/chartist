class AddDefaultChartType < ActiveRecord::Migration
  def change
    change_column_default :charts, :chart_type, 0
  end
end
