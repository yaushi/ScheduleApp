class AddUseridToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :userid, :integer
  end
end
