class AddUserIdToCharts < ActiveRecord::Migration
  def change
    add_reference :charts, :user, index: true
  end
end
