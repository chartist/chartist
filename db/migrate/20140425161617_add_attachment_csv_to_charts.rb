class AddAttachmentCsvToCharts < ActiveRecord::Migration
  def self.up
    change_table :charts do |t|
      t.attachment :csv
    end
  end

  def self.down
    drop_attached_file :charts, :csv
  end
end
