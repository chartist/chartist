class AddColorschemeToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :colorscheme, :integer
  end
end
