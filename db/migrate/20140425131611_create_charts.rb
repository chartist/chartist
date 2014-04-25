class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name
      t.integer :chart_type
      t.integer :x_type

      t.timestamps
    end
  end
end
