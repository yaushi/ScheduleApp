class RemoveDateFromMeetings < ActiveRecord::Migration[5.1]
  def change
    remove_column :meetings, :date, :date
  end
end
