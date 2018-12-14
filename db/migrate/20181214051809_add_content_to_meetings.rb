class AddContentToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :content, :string
    add_column :meetings, :hidden, :boolean
  end
end
