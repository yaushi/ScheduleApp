class AddDateToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :date, :date
  end
end
