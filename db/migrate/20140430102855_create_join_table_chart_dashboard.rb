class CreateJoinTableChartDashboard < ActiveRecord::Migration
  def change
    create_join_table :charts, :dashboards do |t|
      # t.index [:chart_id, :dashboard_id]
      # t.index [:dashboard_id, :chart_id]
    end
  end
end
