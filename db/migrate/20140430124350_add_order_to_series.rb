class AddOrderToSeries < ActiveRecord::Migration
  def change
    add_column :series, :order, :integer
  end
end
