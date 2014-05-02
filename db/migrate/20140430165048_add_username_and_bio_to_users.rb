class AddUsernameAndBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
  end
end
