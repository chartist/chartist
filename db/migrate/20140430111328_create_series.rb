class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.belongs_to :chart, index: true

      t.timestamps
    end
  end
end
