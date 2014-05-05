class AddDescriptionToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :description, :text
  end
end
