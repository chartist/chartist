class AddNameToSeries < ActiveRecord::Migration
  def change
    add_column :series, :name, :string
  end
end
