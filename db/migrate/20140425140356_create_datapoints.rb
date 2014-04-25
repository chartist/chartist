class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.string :x
      t.float :y
      t.belongs_to :chart, index: true

      t.timestamps
    end
  end
end
